import 'dart:convert';
import 'dart:developer' as console;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:mariner/components/lists/header_title.dart';
import 'package:mariner/providers/user_provider.dart';
import 'package:mariner/components/lists/FAB.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/module/popup_alert.dart';

@RoutePage()
class SailorPermissionsPermissionTypesPage extends StatefulWidget {
  const SailorPermissionsPermissionTypesPage({super.key});

  @override
  _SailorPermissionsPermissionTypesPageState createState() => _SailorPermissionsPermissionTypesPageState();
}

class _SailorPermissionsPermissionTypesPageState extends State<SailorPermissionsPermissionTypesPage> {
  late Future<List<SailorPermissionTypeData>> _futurePermissionTypes;

  @override
  void initState() {
    super.initState();
    _futurePermissionTypes = _fetchPermissionTypes(); // Pobieranie danych z API
  }

  Future<List<SailorPermissionTypeData>> _fetchPermissionTypes() async {
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
        return data.map((item) => SailorPermissionTypeData.fromJson(item)).toList();
      } else {
        throw Exception('Nie udało się pobrać danych');
      }
    } catch (e) {
      console.log('Error: $e');
      throw Exception('Błąd podczas pobierania danych: $e');
    }
  }


  Future<void> _deletePermissionType(int id) async {
    final url = 'https://acme-dev.d360.pl/api/v1/sailor-permissions-types/$id';
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
          _futurePermissionTypes = _fetchPermissionTypes();
        });
      } else {
        throw Exception('Nie udało się usunąć rodzaju patentu');
      }
    } catch (e) {
      console.log('Error: $e');
      throw Exception('Błąd podczas usuwania rodzaju patentu: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 16.0),
        child: Column(
          children: [
            // Header
            const Row(
              children: [
                Expanded(child: HeaderTitle(title: 'Rodzaj')),
              ],
            ),

            // FutureBuilder for async data fetching
            Expanded(
              child: FutureBuilder<List<SailorPermissionTypeData>>(
                future: _futurePermissionTypes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Błąd: ${snapshot.error}'));
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final permissionType = snapshot.data![index];
                        return SailorPermissionType(
                          id: permissionType.id,
                          name: permissionType.name,
                          color: permissionType.color,
                          deletePermissionType: ()=>{_deletePermissionType(permissionType.id)}
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
      floatingActionButton: FAB(onPressed: () {
        showModalBottomSheet(context: context, builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: colors['secondary'],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderTitle(title: 'Dodaj nowy rodzaj'),
                TextField(
                  onChanged: (value) {
                    Provider.of<UserProvider>(context, listen: false).editedValue = value;
                  },
                ),
                ElevatedButton(onPressed: () {
                  setState(() {
                    // Dodawanie nowego typu do listy (lokalnie)
                  });
                  Provider.of<UserProvider>(context, listen: false).editedValue = '';
                  Navigator.pop(context);
                }, child: const Text('Dodaj')),
              ],
            ),
          );
        });
      }),
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
// Model danych typu patentu żeglarza
class SailorPermissionTypeData {
  final String name;
  final Color? color;
  final int id;

  SailorPermissionTypeData({required this.name, required this.id, this.color});

  factory SailorPermissionTypeData.fromJson(Map<String, dynamic> json) {
    return SailorPermissionTypeData(
      id: json['id'] as int,
      name: json['name'] as String,
      color: HexColor(json['color']), // Można dynamicznie pobierać kolor
    );
  }
}

class SailorPermissionType extends StatelessWidget {
  const SailorPermissionType({super.key, required this.name, required this.id, required this.deletePermissionType, this.color});

  final String name;
  final Color? color;
  final int id;
  final deletePermissionType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(name, style: TextStyle(color: color))),
        IconButton(onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return PopupAlert(
              title: 'Szczegóły',
              actionsBuilder: (context) {
                return [
                  if (Provider.of<UserProvider>(context).isAdmin) ...[
                    ElevatedButton(
                      onPressed: () {
                        deletePermissionType();
                        PopupAlert.close(context);
                      },
                      child: const Text('Usuń'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        PopupAlert.close(context);
                      },
                      child: const Text('Edytuj'),
                    ),
                  ] else ...[
                    TextButton(
                      onPressed: () {
                        PopupAlert.close(context);
                      },
                      child: const Text('Zamknij'),
                    ),
                  ],
                ];
              },
              children: [
                Text('Nazwa typu: $name'),
                Text('Kolor: RGB(${color?.red ?? 0}, ${color?.green ?? 0}, ${color?.blue ?? 0})'),
              ],
            );
          });
        }, icon: const Icon(Icons.more_vert)),
      ],
    );
  }
}
