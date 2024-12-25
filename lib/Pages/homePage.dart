import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/Models/Note.dart';
import 'package:notesapp/Models/NoteDATABASE.dart';
import 'package:notesapp/UI/noteTile.dart';
import 'package:provider/provider.dart';

class homePage extends StatefulWidget{
  const homePage({super.key});
  @override
  State<homePage> createState() => _createState();
}

class _createState extends State<homePage>{
  void readNote(){
    context.read<NoteDatabase>().fetchAll();
  }
  @override
  void initState(){
    super.initState();
    readNote();
  }
  @override
  Widget build(BuildContext context) {
    final notedb = context.watch<NoteDatabase>();
    List<Note> notes = notedb.notes;
    TextEditingController controller = TextEditingController();
    void showDi(TextEditingController controller,void Function()? onPressed){
        showDialog(context: context,
          builder: (context){
            return AlertDialog(backgroundColor: Colors.lightGreen[100],
              content: Container(
                width: 400,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 50,),
                    MaterialButton(onPressed: onPressed,

                      color: Colors.greenAccent[100],child: Text("Save"),
                    )
                  ],
                ),
              ),
            );
          });
    }
      return Consumer<NoteDatabase>(builder: (context,value,child){
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: (){
            showDi(controller,(){
              Provider.of<NoteDatabase>(context,listen: false).add(controller.text);
              Navigator.pop(context);
            });
          },backgroundColor: Colors.greenAccent[100],child: Icon(Icons.add),),
          appBar: AppBar(
            backgroundColor:Colors.lightGreen[100]
            ,
          ),
          backgroundColor: Colors.lightGreen[100],
          body: Column(
            children: [
              Text("Notes",style:GoogleFonts.playfairDisplay(
                // Playfair Display
// <weight>: Use a value from 400 to 900
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Playfair Display',
                  fontSize: 40,
                  fontVariations: [
                    FontVariation('ital', 0),
                    FontVariation('wght', 500),
                    FontVariation('ital', 1),
                    FontVariation('wght', 500)
                  ],
                ),
              ),
                // Playfair Display
                // <weight>: Use a value from 400 to 900
              ),
              SizedBox(height: 15,),
              Expanded(child: ListView.builder(itemBuilder: (context,index){
                return noteTile(note:notes[index],delete:(){
                  context.read<NoteDatabase>().delete(notes[index].id);
                } ,edit:(){
                  showDi(controller, (){
                    context.read<NoteDatabase>().update(notes[index].id,controller.text);
                    Navigator.pop(context);
                  });
                } );
              } ,itemCount:notes.length ,))

            ],
          ),
        );
      });
  }

}

