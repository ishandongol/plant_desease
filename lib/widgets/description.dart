import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String title;
  final String description;

  const Description({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )),
          Text(
            description,
            style: const TextStyle(color: Color.fromARGB(255, 130, 130, 130)),
          )
        ],
      ),
    );
  }
}
