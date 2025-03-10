import 'package:flutter/material.dart';

class ScanIdTile extends StatelessWidget {
  const ScanIdTile({
    super.key,
    required this.title, required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            minimumSize: Size(300, 180)),
        icon: Icon(
          Icons.camera_alt_rounded,
          color: const Color.fromARGB(255, 0, 77, 139),
          size: 40,
        ),
        label: Text(
          title,
          style: TextStyle(
              fontSize: 25,
              color: const Color.fromARGB(255, 0, 77, 139),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ));
  }
}