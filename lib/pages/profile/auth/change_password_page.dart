import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  

  @override
  void initState() {
    super.initState();// Pobieranie aktualnego hasła przy inicjalizacji
  }

  Future<void> _changePassword() async {
    String oldPassword = _oldPasswordController.text;
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Sprawdzanie, czy stare hasło jest poprawne

    // Sprawdzanie, czy nowe hasła się zgadzają
    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nowe hasła się nie zgadzają')),
      );
      return;
    }
    if (newPassword.length <6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nowe hasła musi mieć minimalnie 6 znaków')),
      );
      return;
    }
    // Wysłanie zapytania do API w celu zmiany hasła
    const url = 'https://acme-dev.d360.pl/api/v1/user?_method=PUT';
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Błąd autoryzacji')),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'old_password': oldPassword,
          'new_password': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Hasło zmienione pomyślnie')),
        );
        Navigator.of(context).pop(); // Zamknięcie ekranu po udanej zmianie hasła
      } else if(response.statusCode==401){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Wprowadzono błędne hasło')),
        );
      
      } else {
        throw Exception('Nie udało się zmienić hasła.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Błąd: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zmień hasło')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(controller: _oldPasswordController, label: 'Stare hasło'),
            InputField(controller: _newPasswordController, label: 'Nowe hasło'),
            InputField(controller: _confirmPasswordController, label: 'Powtórz nowe hasło'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _changePassword, 
              child: const Text('Zmień hasło'),
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({super.key, required this.label, required this.controller});

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true, // Ukrywanie hasła
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
