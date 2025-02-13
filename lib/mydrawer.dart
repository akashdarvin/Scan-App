import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.qr_code,
              color: Colors.black,
              size: 50,
            ),
          ),
          // profile
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              "P R O F I L E",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          //settings
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "S E T T I N G S",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          //logout
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "L O G O U T",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
