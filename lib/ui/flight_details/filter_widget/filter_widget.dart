import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final String filterType;

  FilterWidget({required this.filterType});

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Container(
      width: _width / 2.43,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            filterType,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 13),
          ),
           IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.grey[700],
              ),
            ),
        ],
      ),
    );
  }
}
