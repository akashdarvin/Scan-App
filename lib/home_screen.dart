// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'mydrawer.dart';
// import 'scanidtile.dart';

// class HomeScreen extends StatelessWidget {
//  HomeScreen({super.key});
// final ImagePicker _picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         drawer: MyDrawer(),
//         appBar: AppBar(
          
//           leading: Builder(builder: (context) {
//             return InkWell(
//               onTap: () {
//                 Scaffold.of(context).openDrawer();
//               },
//               child: Icon(
//                 Icons.menu,
//                 color: Colors.white,
//               ),
//             );
//           }),
//           backgroundColor: const Color.fromARGB(255, 0, 9, 33),
//           title: Text(
//             "ScanMe",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//               fontStyle: FontStyle.italic,
//             ),
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 26, 1, 69),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // 1st button for front id
//               ScanIdTile(title: "Scan Front of ID Card",
//               onPressed: (){
//                 _openCamera();
//               },),
//               SizedBox(
//                 height: 80,
//               ),
//               //2nd button
//               ScanIdTile(title: "Scan Back of ID Card",
//               onPressed: (){
//                 _openCamera();
//                 },),
//               SizedBox(
//                 height: 100,
//               ),
//               // upload image from gallery button
//               ElevatedButton.icon(
//                   onPressed: () {
//                     //gallery picker
//                   },
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30)),
//                       minimumSize: Size(100, 50)),
//                   icon: Icon(
//                     Icons.upload,
//                     size: 20,
//                     color: Colors.black,
//                   ),
//                   label: Text(
//                     "Upload Image",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   ))
//             ],
//           ),
//         ),
//       );
//   }
//    Future<void> _openCamera() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera,);

//     if (image != null) {
//       print("Image Path: ${image.path}");
//     }
//   }
// }



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'scanidtile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 9, 33),
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
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.history, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 26, 1, 69),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1st button for front ID
            ScanIdTile(
              title: "Scan Front of ID Card",
              onPressed: () {
                _openCamera();
              },
            ),
            SizedBox(height: 80),
            // 2nd button for back ID
            ScanIdTile(
              title: "Scan Back of ID Card",
              onPressed: () {
                _openCamera();
              },
            ),
            SizedBox(height: 100),
            // Upload image from gallery button
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
              icon: Icon(Icons.upload, size: 20, color: Colors.black),
              label: Text(
                "Upload Image",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print("Image Path: ${image.path}");
    }
  }

  Future<void> _openGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print("Gallery Image Path: ${image.path}");
    }
  }
}
