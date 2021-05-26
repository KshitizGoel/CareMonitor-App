import 'package:flutter/material.dart';

class ClassWidget extends StatefulWidget {
  final String className;

  ClassWidget({required this.className});

  @override
  _ClassWidgetState createState() => _ClassWidgetState(className);
}

class _ClassWidgetState extends State<ClassWidget> {
  bool pressAttention = false;

  final String className;

  _ClassWidgetState(this.className);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => pressAttention = !pressAttention),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.70)),
            color: pressAttention
                ? Colors.teal.withOpacity(0.70)
                : Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Text(
            className,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: pressAttention ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
