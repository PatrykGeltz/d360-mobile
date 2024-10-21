import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
// import 'package:mariner/pages/side_menu/user_profile.dart';
import 'package:provider/provider.dart';
import 'package:mariner/providers/user_provider.dart';

import 'package:mariner/theme/colors.dart';

import 'package:mariner/components/side_menu/user_data.dart';
import 'package:mariner/components/side_menu/edit_credential.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:cross_file_image/cross_file_image.dart';
import 'dart:io';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeData = RouteData.of(context);
    final colors = ThemeColors.of(context);

    final ImagePicker picker = ImagePicker();

    return Scaffold(
      appBar: AppBar(title: Text(routeData.title(context)),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey, radius: 40.0,
                        backgroundImage: XFileImage(Provider.of<UserProvider>(context).imagePath),
                      ),
                      TextButton(onPressed: () async {
                          XFile? response = await picker.pickImage(source: ImageSource.gallery);
                          Provider.of<UserProvider>(context, listen: false).setImagePath(response!);
                        }, child: const Text('Zmień zdjęcie'))
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

            UserData(
              fieldName: 'Imię',
              data: Provider.of<UserProvider>(context).name,
              onTap: (){ print('Edit name');},
            ),
            UserData(
                fieldName: 'Nazwisko',
                data: Provider.of<UserProvider>(context).surname,
                onTap: (){ print('Edit surname');}
            ),
            // UserData(
            //   fieldName: 'Pesel',
            //   data: '000000000',
            //   onTap: (){ print('Edit pesel'); },
            // ),
            // UserData(
            //     fieldName: 'Rola',
            //     data: 'woźny'
            // ),

            const Expanded(child: SizedBox()),
            ElevatedButton(onPressed: (){ Navigator.pop(context); }, child: const Text('Zapisz i wyjdź'))
          ],
        ),
      ),
    );
  }
}
