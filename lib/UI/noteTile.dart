import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/Models/Note.dart';

class noteTile extends StatelessWidget{
  void Function()? edit;
  void Function()? delete;
  Note note;
  noteTile({super.key,required this.note,this.edit,this.delete});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey
      ),
      child: Row(
        children: [
          Container(
            child: Row(
              children: [
                Text(note.text),
                IconButton(onPressed: edit, icon: Icon(Icons.edit)),
                IconButton(onPressed: delete, icon: Icon(Icons.delete))
              ],
            ),
          ),
          
        ],
      ),
    );
  }

}