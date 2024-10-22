import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:auto_route/auto_route.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mariner/providers/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:mariner/theme/colors.dart';
import 'package:mariner/components/side_menu/user_data.dart';
import 'package:mariner/components/side_menu/edit_credential.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = 'Jan Kowalski';
  String avatarUrl = '';
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  late UserProvider user;
  late UserProvider userSet;
  @override
  void initState() {
    super.initState();
    _nameController.text = userName;
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    const url = 'https://acme-dev.d360.pl/api/v1/user';
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");
    try {
      final response = await http.get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {

          userName = data['data']['name'] ?? 'No Name';
          avatarUrl = data['data']['avatar_photo'] ?? '';
          _nameController.text = userName;
        });
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _cropImage(pickedFile.path);
    }
  }

  Future<void> _cropImage(String imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Przytnij zdjęcie',
          toolbarColor: Theme.of(context).primaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
      ],
      maxWidth: 256,
      maxHeight: 256,
    );

    if (croppedFile != null) {
      setState(() {
        _image = File(croppedFile.path);
      });
    }
  }

  Future<void> _editProfile() async {


    const url = 'https://acme-dev.d360.pl/api/v1/user?_method=PUT';
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("access_token");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['Accept'] = 'application/json';
      if (_image!=null){
        request.files.add(
        await http.MultipartFile.fromPath(
          'avatar_photo',
          _image!.path,
          filename: 'avatar.png',
          contentType: MediaType('image', 'png'),
        ),
      );
      }
      

      request.fields['name'] = _nameController.text; // Add username field

      var response = await request.send();

      if (response.statusCode == 200) {
        var resp = jsonDecode(await response.stream.bytesToString());
        var image = resp['data']['avatar_photo'];
        setState(() {
          
          userSet.setName(_nameController.text);
          userSet.setAvatar(image ?? '');
        });
        Navigator.pop(context, true);
      } else {
        // final errorResponse = await response.stream.bytesToString();
        // print('Error: $errorResponse');
        throw Exception('Failed to upload');
      }

    } catch (e) {
      // print('Error: ${e.toString()}');
      Navigator.pop(context, false);
    }
    
    
  }

  @override
  Widget build(BuildContext context) {
    final routeData = RouteData.of(context);
    final colors = ThemeColors.of(context);
    user = Provider.of<UserProvider>(context);
    userSet = Provider.of<UserProvider>(context, listen: false);

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
                        backgroundColor: Colors.grey,
                        radius: 40.0,
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : (user.avatarUrl.isNotEmpty ? NetworkImage(user.avatarUrl) : const AssetImage('assets/images/logo.png')),
                      ),
                      TextButton(
                        onPressed: _pickImage,
                        child: const Text('Zmień zdjęcie'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text('Nazwa użytkownika'),
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Podaj nową nazwę',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                _editProfile();

              },
              child: const Text('Zapisz i wyjdź'),
            ),
          ],
        ),
      ),
    );
  }
}
