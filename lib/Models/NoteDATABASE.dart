import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notesapp/Models/Note.dart';
import 'package:path_provider/path_provider.dart';
class NoteDatabase extends ChangeNotifier{
  static late Isar isar;
  //initialize
  static Future<void> initialize() async{
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  final List<Note> notes = [];
  //CREATE
  Future<void> add(String text) async {
    final newNote = Note()
      ..text = text;
    await isar.writeTxn(() => isar.notes.put(newNote));
    fetchAll();
  }
  //READ
  Future<void> fetchAll() async{
    List<Note> fetchnotes = await isar.notes.where().findAll();
    notes.clear();
    notes.addAll(fetchnotes);
    notifyListeners();
  }
  //UPDATE
  Future<void> update(int id,String text) async {
    final note = await isar.notes.get(id);
    if(note!=null){
      note.text = text;
      await isar.writeTxn(()=> isar.notes.put(note));
      await fetchAll();
    }
  }
  //DELETE
  Future<void> delete(int id) async{
    await isar.writeTxn(()=>isar.notes.delete(id));
    await fetchAll();
  }
}