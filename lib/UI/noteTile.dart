import 'package:flutter/cupertino.dart';
import 'package:notesapp/Models/Note.dart';

class noteTile extends StatelessWidget{
  Note note;
  noteTile({super.key,required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        children: [
          Text(note.text),
        ],
      ),
    );
  }

}