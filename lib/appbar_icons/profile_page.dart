import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 140, 195, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 162, 239),
        title: Center(child: Text("P R O F I L E")),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("profile photo"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text("privacy"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
