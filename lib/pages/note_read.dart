import 'package:bootcamp_app/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteReadScreen extends StatefulWidget {
  NoteReadScreen(this.doc, {Key? key}) : super(key: key);

  final QueryDocumentSnapshot doc;

  @override
  State<NoteReadScreen> createState() => _NoteReadScreenState();
}

class _NoteReadScreenState extends State<NoteReadScreen> {
  // Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> deleteNote() async {
    // Get the document reference
    DocumentReference noteRef =
        firestore.collection('Notes').doc(widget.doc.id);

    try {
      // Delete the document
      await noteRef.delete();

      // Navigate back to previous screen or perform any other action
      Navigator.pop(context);
    } catch (e) {
      print('Error deleting note: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    int colorId = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: Appstyle.cardsColor[colorId],
      appBar: AppBar(
        backgroundColor: Appstyle.cardsColor[colorId],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc['note_title'],
              style: Appstyle.mainTitle,
            ),
            SizedBox(height: 4.0),
            Text(
              widget.doc['creation_date'],
              style: Appstyle.dateTitle,
            ),
            SizedBox(height: 18.0),
            Text(
              widget.doc['note_content'],
              style: Appstyle.mainContent,
              overflow: TextOverflow.visible,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: deleteNote,
        label: Text('Notu Sil'),
        icon: Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
