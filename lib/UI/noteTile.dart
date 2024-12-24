import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/Models/Note.dart';

class noteTile extends StatelessWidget{
  void Function()? edit;
  void Function()? delete;
  Note note;
  noteTile({super.key,required this.note,this.edit,this.delete});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 15,),
            Container(
              child: Row(
                children: [
                  Text(note.text,style: GoogleFonts.josefinSans(
                    textStyle: TextStyle(
                      fontFamily: 'Josefin Sans',
                      fontSize: 18,
                      fontVariations: [
                        FontVariation('ital', 0),
                        FontVariation('wght', 400)
                      ],
                    ),
                  ),),
                  IconButton(onPressed: edit, icon: Icon(Icons.edit)),
                  IconButton(onPressed: delete, icon: Icon(Icons.delete))
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}