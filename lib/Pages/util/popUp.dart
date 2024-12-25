import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/Pages/util/menuItem/MenuItem.dart';
import 'package:popover/popover.dart';

class popUp extends StatelessWidget{
  void Function()? edit;
  void Function()? delete;
  popUp({super.key,required this.edit,required this.delete});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.more_vert_rounded),
      onTap: ()=>{
        showPopover(
            height: 100,
            direction: PopoverDirection.top,
            context: context, bodyBuilder: (context)=> MenuItem(edit: edit, delete: delete,)
        )
      },
    );
  }
}