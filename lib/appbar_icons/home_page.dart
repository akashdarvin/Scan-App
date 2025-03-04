import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 140, 195, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 162, 239),
        title: Center(child: Text("H O M E")),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.storage),
            title: Text("storage"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
