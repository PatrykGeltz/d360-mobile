import 'dart:convert';
import 'dart:developer' as console;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mariner/components/module/labeled_checkbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mariner/components/contributions/contributions_list.dart';
import 'package:mariner/models/contribution_model.dart';

@RoutePage()
class ContributionsContributionsPage extends StatefulWidget {
  const ContributionsContributionsPage({super.key});

  @override
  _ContributionsContributionsPageState createState() => _ContributionsContributionsPageState();
}

class _ContributionsContributionsPageState extends State<ContributionsContributionsPage> {
  late Future<List<ContributionModel>> _futureContributions;

  // Zmienne do przechowywania danych składki
  String _name = '';
  double _billingAmount = 0.0;
  final TextEditingController _startDate = TextEditingController();
  final CheckboxController _isForJunior = CheckboxController();
  final CheckboxController _isActive = CheckboxController();
  final CheckboxController _isAdditional = CheckboxController();

  @override
  void initState() {
    super.initState();
    _futureContributions = _fetchContributions(); // Pobieranie danych z API
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.tryParse(_startDate.text) ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        _startDate.text = "${selectedDate.toLocal()}".split(' ')[0]; // Ustawienie wybranej daty w polu
      });
    }
  }

  Future<List<ContributionModel>> _fetchContributions() async {
    const url = 'https://acme-dev.d360.pl/api/v1/contributions';
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");

    if (token == null) {
      throw Exception('Brak autoryzacji');
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
        return data.map((item) => ContributionModel.fromJson(item)).toList();
      } else {
        throw Exception('Nie udało się pobrać danych');
      }
    } catch (e) {
      console.log('Error: $e');
      throw Exception('Błąd podczas pobierania danych: $e');
    }
  }

  Future<void> _addContribution() async {
    const url = 'https://acme-dev.d360.pl/api/v1/contributions';
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");
    if (token == null) {
      throw Exception('Brak autoryzacji');
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
          'name': _name,
          'billing_amount': _billingAmount.toString(),
          'for_junior': _isForJunior.value,
          'start_date': _startDate.text,
          'is_additional': _isAdditional.value,
          'is_active': _isActive.value,
        }),
      );

      if (response.statusCode == 200) {
        // Jeśli wszystko się powiedzie, odśwież listę składek
        setState(() {
          _futureContributions = _fetchContributions();
        });
      } else {
        throw Exception('Nie udało się dodać składki');
      }
    } catch (e) {
      console.log('Error: $e');
      throw Exception('Błąd podczas dodawania składki: $e');
    }
  }

  Future<void> _deleteContribution(int id) async {
    final url = 'https://acme-dev.d360.pl/api/v1/contributions/$id';
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
          _futureContributions = _fetchContributions(); // Odświeżenie listy po usunięciu składki
        });
        console.log('Contribution with ID $id deleted successfully');
      } else {
        throw Exception('Nie udało się usunąć składki');
      }
    } catch (e) {
      console.log('Error: $e');
      throw Exception('Błąd podczas usuwania składki: $e');
    }
  }

  Future<void> _editContribution(int id, ContributionModel updatedContribution) async {
    final url = 'https://acme-dev.d360.pl/api/v1/contributions/$id';
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");

    if (token == null) {
      throw Exception('Brak autoryzacji');
    }

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'id': updatedContribution.id,
          'name': updatedContribution.name,
          'billing_amount': updatedContribution.billingAmount.toString(),
          'for_junior': updatedContribution.isForJunior,
          'start_date': updatedContribution.startDate,
          'is_additional': updatedContribution.isAdditional,
          'is_active': updatedContribution.isActive
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          _futureContributions = _fetchContributions(); // Odświeżenie listy po edycji składki
        });
        console.log('Contribution with ID $id edited successfully');
      } else {
        throw Exception('Nie udało się zaktualizować składki');
      }
    } catch (e) {
      console.log('Error: $e');
      throw Exception('Błąd podczas edycji składki: $e');
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<ContributionModel>>(
          future: _futureContributions,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Błąd: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ContributionsList(
                contributions: snapshot.data!,
                onDelete: (index) {
                  final contribution = snapshot.data![index];
                  _deleteContribution(contribution.id);  // Wywołanie usuwania
                },
                onEdit: (index, newContribution) {
                  final contribution = snapshot.data![index];
                  _editContribution(contribution.id, newContribution);  // Wywołanie edycji
                },
              );
            } else {
              return const Center(child: Text('Brak danych do wyświetlenia'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            
            isScrollControlled: true, // Umożliwia kontrolę wysokości
            builder: (context) {
              return Container(
                height: 500,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Dodaj nową składkę', style: TextStyle(fontSize: 18)),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Nazwa składki'),
                      onChanged: (value) {
                        _name = value;
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Kwota'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _billingAmount = double.tryParse(value) ?? 0.0;
                      },
                    ),
                    GestureDetector(
                      onTap: () => _selectDate(context), // Wywołanie selektora daty
                      child: AbsorbPointer(
                        child: TextField(
                          controller: _startDate,
                          decoration: InputDecoration(
                            labelText: 'Data (YYYY-MM-DD)',
                            // hintText: _startDate.text.isEmpty ? 'Wybierz datę' : _startDate.text,
                          ),
                        ),
                      ),
                    ),
                      
                    LabeledCheckbox(
                      label: ('Dla juniora'),
                      controller: _isForJunior,
                    ),
                    LabeledCheckbox(
                      label: ('Aktywna'),
                      controller: _isActive,
                    ),
                    LabeledCheckbox(
                      label: ('Dodatkowa'),
                      controller: _isAdditional,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _addContribution(); // Dodawanie składki
                        Navigator.pop(context); // Zamknięcie modalu
                      },
                      child: const Text('Dodaj'),
                    ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
    );
  }
}
