import 'package:flutter/material.dart';

class FieldItem extends StatelessWidget {
  const FieldItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(title),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(':'),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
