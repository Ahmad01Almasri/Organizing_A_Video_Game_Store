import 'package:flutter/material.dart';

class DrawerListTitel extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? ontap;
  const DrawerListTitel(
      {super.key, required this.icon, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      onTap: ontap,
    );
  }
}
