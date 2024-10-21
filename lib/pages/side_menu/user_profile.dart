import 'package:flutter/material.dart';
import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/side_menu/user_data.dart';

class UserProfile extends StatelessWidget {
  static const String id = '/profile';

  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Twój profil'),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const CircleAvatar(backgroundColor: Colors.grey, radius: 40.0,),
                      TextButton(onPressed: (){print('change prof'); }, child: const Text('Zmień zdjęcie'))
                    ],
                  ),
                ),

                Column(
                  children: [
                    const Text('Nazwa użytkownika'),
                    Row(
                      children: [
                        const Text('Jan Kowalski', style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20
                        ),),
                        IconButton(onPressed: (){print('Edit name');}, icon: const Icon(Icons.edit))
                      ],
                    ),
                  ],
                ),

              ],
            ),
            Divider( color: colors['special'], ),

            UserData(fieldName: 'Imię', data: 'Jan', onTap: (){ print('Edit name'); },),
            UserData(fieldName: 'Nazwisko', data: 'Kowalski', onTap: (){ print('Edit surname');} ),
            UserData(fieldName: 'Pesel', data: '00000000001', onTap: (){ print('Edit pesel'); },),
            UserData(fieldName: 'Rola', data: 'Woźny'),
            
            const Expanded(child: SizedBox()),
            ElevatedButton(onPressed: (){ Navigator.pop(context); }, child: const Text('Zapisz i wyjdź'))
          ],
        ),
      ),
    );
  }
}
