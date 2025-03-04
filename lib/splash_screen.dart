import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the content vertically
        children: const [
          Center(
            child: CircularProgressIndicator(), // Display a loading indicator
          ),
          SizedBox(height: 20),
          Text("Scan Me", style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:scanapp/home_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override

//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), (){
//       Navigator.pushReplacement(context, 
//       MaterialPageRoute(builder: (context) => HomeScreen(), ));
//     } );
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red[200],
//       body: Center(
//         child: Image.network('https://www.freepik.com/free-vector/protected-personal-data-laptop-isometric-illustration-with-colorful-elements-white_17233017.htm#fromView=image_search_similar&page=1&position=45&uuid=44c13c74-13d6-4ab5-9a1d-b63111e08ac9.png'),
//       ),
//     );
//   }
// }