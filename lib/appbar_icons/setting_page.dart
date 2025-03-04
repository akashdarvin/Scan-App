import 'package:flutter/material.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 140, 195, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 162, 239),
        title: Center(child: Text("S E T T I N G S")),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.brush),
            title: Text("theme"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
