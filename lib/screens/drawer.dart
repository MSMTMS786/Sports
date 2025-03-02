import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  File? _avatarImage;
  final String _avatarKey = 'avatar_image_path';

  @override
  void initState() {
    super.initState();
    _loadAvatar(); // Load avatar from shared preferences when app starts
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _avatarImage = File(image.path); // Set the selected image
        _saveAvatar(image.path); // Save the image path
      });
    }
  }

  // Load avatar from shared preferences
  Future<void> _loadAvatar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? avatarPath = prefs.getString(_avatarKey);

    if (avatarPath != null) {
      setState(() {
        _avatarImage = File(avatarPath); // Load image from saved path
      });
    }
  }

  // Save avatar path to shared preferences
  Future<void> _saveAvatar(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_avatarKey, path);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff00ff00),
              Color.fromARGB(0, 17, 108, 10),
              
             
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
         
        
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent, // Transparent to let the gradient show
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _pickImage, // Open image picker when tapped
                    child: CircleAvatar(
                      radius: 50, // Set size of the avatar
                      backgroundImage: _avatarImage != null
                          ? FileImage(_avatarImage!)
                          : const AssetImage('images/default_avatar.png')
                              as ImageProvider, // Placeholder image
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Tap to change avatar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            GestureDetector(
              onTap: () {
                // Navigator.(context);
              },
              child: ListTile(
                leading: const Icon(Icons.info, color: Colors.white),
                title: const Text('info', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.35),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                
                child: ListTile(
                  
                    title: const Text('     3Degree786@gmail.com', style: TextStyle(fontSize: 18,color: Colors.black54)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
