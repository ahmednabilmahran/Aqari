import 'package:flutter/material.dart';

/// CustomListTile is used to manage the custom list tile
class CustomListTile extends StatelessWidget {
  /// CustomListTile is used to manage the custom list tile
  const CustomListTile({
    required this.name,
    required this.image,
    required this.subtitle,
    super.key,
  });

  /// name is used to manage the name of the list tile
  final String? name;

  /// image is used to manage the image of the list tile
  final String? image;

  /// subtitle is used to manage the subtitle of the list tile
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(image!),
      title: Text(
        name!,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          subtitle!,
          style: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Montserrat',
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
