import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class LocomotiveWidget extends StatelessWidget {

  final IconData icon;
  final Color colors;
  final String type;

  LocomotiveWidget({required this.icon ,required this.colors ,required this.type});

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(50)
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                icon,
                color: colors,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top : 5.0),
            child: Text(type , style: TextStyle( color: Colors.grey[700]),),
          )
        ],
      );

  }
}
