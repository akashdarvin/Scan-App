import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scanapp/appbar_icons/profile_page.dart';
import 'package:scanapp/appbar_icons/setting_page.dart';
import 'appbar_icons/home_page.dart';
import 'scanidtile.dart';
import 'dart:io'; // For File class
import 'package:http/http.dart' as http; // For sending HTTP requests
import 'package:http_parser/http_parser.dart'; // For content type

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  late String name = "";

  void navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 6, 60, 104),
        title: Text(
          "ScanMe",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () => navigateToPage(
              context,
               HomePage()),
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () => navigateToPage(
              context,
               ProfilePage()),
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () => navigateToPage(
              context,
              Settingpage()),
          ),
        ],
      ),
      backgroundColor:  const Color.fromARGB(255, 0, 77, 139),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! NAME WILL BE UPDATED BY SETSTATE AFTER API CALL
            // Text(name),   
            ScanIdTile(
              title: "Scan Front of ID Card",
              onPressed: () {
                _openCamera();
              },
            ),
            SizedBox(height: 100),

            ScanIdTile(
              title: "Scan Back of ID Card",
              onPressed: () {
                _openCamera();
              },
            ),
            SizedBox(height: 100),
            
            ElevatedButton.icon(
              onPressed: () {
                _openGallery();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: Size(100, 50),
              ),
              icon: Icon(Icons.upload, size: 20, color: const Color.fromARGB(255, 0, 77, 139)),
              label: Text(
                "Upload Image",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 77, 139),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _openCamera() async {
    await _picker.pickImage(source: ImageSource.camera);
  }

  Future<void> _openGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      await _uploadImage(file);
    }
  }

  Future<void> _uploadImage(File file) async {
    try {
      var uri = Uri.parse("http://127.0.0.1:8000/extract-info/");

      final int integer = int.parse("123");

      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath(
          'file', // Key for the file in the request
          file.path,
          contentType:
              MediaType('image', 'jpeg'), // Update if file type is different
        ));

      var response = await request.send();

      if (response.statusCode == 200) {
        debugPrint("Upload successful!");
        final responseData = await http.Response.fromStream(response);

        // Parse the JSON response
        final Map<String, dynamic> responseJson = jsonDecode(responseData.body);

        // Assign name from the response to the 'name' variable
        String nameFromResponse = responseJson['name'];
        debugPrint('Name from response: $nameFromResponse');

        setState(() {
          name = nameFromResponse;
        });
      } else {
        debugPrint("Upload failed with status: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error occurred: $e");
    }
  }
}
