import 'dart:convert';
import 'dart:developer' as console;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:mariner/components/lists/FAB.dart';
import 'package:mariner/providers/user_provider.dart';
import 'package:mariner/components/lists/header_title.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/module/popup_alert.dart';
import 'package:mariner/components/sailor_permissions/permission.dart';

@RoutePage()
class SailorPermissionsPermissionsPage extends StatefulWidget {
  const SailorPermissionsPermissionsPage({super.key});

  @override
  _SailorPermissionsPermissionsPageState createState() => _SailorPermissionsPermissionsPageState();
}

class _SailorPermissionsPermissionsPageState extends State<SailorPermissionsPermissionsPage> {
  late Future<List<SailorPermissionData>> _futurePermissions;
  late Map<String, int> types = {};
  String? selectedType;
  String permissionName = '';

  @override
  void initState() {
    super.initState();
    _futurePermissions = _fetchSailorPermissions(); 
    _fetchPermissionTypes();
  }

  Future<List<SailorPermissionData>> _fetchSailorPermissions() async {
    const url = 'https://acme-dev.d360.pl/api/v1/sailor-permissions?=&page=1';
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");

    if (token == null) {
      throw Exception('Błąd autoryzacji');
    }

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['data'];
        return data.map((item) => SailorPermissionData.fromJson(item)).toList();
      } else {
        throw Exception('Nie udało się pobrać danych');
      }
    } catch (e) {
      console.log('Error: $e');
      throw Exception('Błąd podczas pobierania danych: $e');
    }
  }

  Future<void> _fetchPermissionTypes() async {
    const url = 'https://acme-dev.d360.pl/api/v1/sailor-permissions-types?page=1';
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");

    if (token == null) {
      throw Exception('Błąd autoryzacji');
    }

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['data'];
        for (var type in data) {
          types[type['name']] = type['id'];
        }
        print(types);
      } else {
        throw Exception('Nie udało się pobrać danych');
      }
    } catch (e) {
      console.log('Error: $e');
      throw Exception('Błąd podczas pobierania danych: $e');
    }
  }

  Future<void> _addPermission() async {
    const url = 'https://acme-dev.d360.pl/api/v1/sailor-permissions';
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");
    if(selectedType == null) selectedType=types.keys.first;
    if (token == null || permissionName.isEmpty) {
      throw Exception('Brak autoryzacji lub niekompletne dane');
    }

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': permissionName,
          'sailor_permissions_type_id': types[selectedType],
        }),
      );

      if (response.statusCode == 200) {
        // Jeśli wszystko się powiedzie, odśwież listę patentów
        setState(() {
          _futurePermissions = _fetchSailorPermissions();
        });
      } else if(response.statusCode==42){
        throw Exception('Patent o podanej nazwie już istnieje');
      }else {
        throw Exception('Nie udało się dodać patentu');
      }
    } catch (e) {
      console.log('Error: $e');
      throw Exception('Błąd podczas dodawania patentu: $e');
    }
  }

  Future<void> _deletePermission(int id) async {
    final url = 'https://acme-dev.d360.pl/api/v1/sailor-permissions/$id';
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");

    if (token == null) {
      throw Exception('Brak autoryzacji');
    }

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          // Odświeżanie listy po usunięciu patentu
          _futurePermissions = _fetchSailorPermissions();
        });
      } else {
        throw Exception('Nie udało się usunąć patentu');
      }
    } catch (e) {
      console.log('Error: $e');
      throw Exception('Błąd podczas usuwania patentu: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0),
        child: Column(
          children: [
            // Headers
            const Row(
              children: [
                Expanded(
                  child: HeaderTitle(title: 'Nazwa'),
                ),
                Expanded(
                  child: HeaderTitle(title: 'Typ'),
                ),
                SizedBox(width: 40),
              ],
            ),
            // FutureBuilder for async data fetching
            Expanded(
              child: FutureBuilder<List<SailorPermissionData>>(
                future: _futurePermissions,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Błąd: ${snapshot.error}'));
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final permission = snapshot.data![index];
                        return Permission(
                          id: permission.id,
                          name: permission.name,
                          type: permission.type,
                          color: permission.color,
                          deletePermission: ()=>{_deletePermission(permission.id)}
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('Brak danych do wyświetlenia'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FAB(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: colors['background'],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const HeaderTitle(title: 'Dodaj nowy patent'),
                  TextField(
                    onChanged: (value) {
                      permissionName = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nazwa patentu',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  DropdownMenu(
                    initialSelection: types.keys.first,
                    onSelected: (value) {
                      setState(() {
                        selectedType = value;
                      });
                    },
                    width: double.maxFinite,
                    dropdownMenuEntries: types.keys.map<DropdownMenuEntry<String>>((String name) {
                      return DropdownMenuEntry<String>(value: name, label: name);
                    }).toList(),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await _addPermission();
                        Navigator.pop(context); // Zamknięcie modala po dodaniu
                      } catch (e) {
                        console.log('Error: $e');
                      }
                    },
                    child: const Text('Dodaj'),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
// Dane patentu żeglarza
class SailorPermissionData {
  final String name;
  final String type;
  final Color? color;
final int id;
  SailorPermissionData({required this.name, required this.id, required this.type, this.color});

  factory SailorPermissionData.fromJson(Map<String, dynamic> json) {
    return SailorPermissionData(
      id:json['id'] as int,
      name: json['name'] as String,
      type: json['sailor_permission_type']['name'] as String,
      color: HexColor(json['sailor_permission_type']['color'],
      )
    );
  }
}