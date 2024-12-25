import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget{
  void Function()? edit;
  void Function()? delete;
  MenuItem({super.key,required this.edit,required this.delete});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Container(
            decoration: BoxDecoration(color: Colors.green[400]),
            child: IconButton(onPressed: edit, icon: Icon(Icons.edit)),
          ),
          Container(
              child: IconButton(onPressed: delete, icon: Icon(Icons.delete))
          )
      ],
    );
  }
}