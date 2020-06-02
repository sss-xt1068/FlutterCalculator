import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class QuikNote extends StatefulWidget {
  @override
  _QuikNoteState createState() => _QuikNoteState();
}

class _QuikNoteState extends State<QuikNote> {
  // final notes = List<String>.generate(5, (i) => "Note $i");
  final List notes = [
    'I have to feed the cat',
    'Go to electronics shop and buy the conduit',
    'Buy milk at 6 a.m.',
  ];
  TextEditingController noteField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Flexible(
              flex: 3,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      Icons.note,
                      color: Colors.orange[300],
                    ),
                    title: Text(notes[index]),
                  );
                },
                itemCount: notes.length,
              )),
          Flexible(
            // flex: 1,
            child: Container(
              height: 100,
              child: TextField(
                textAlign: TextAlign.center,
                controller: noteField,
                decoration: InputDecoration(hintText: 'Type note'),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: MaterialButton(
              onPressed: () async {
                setState(() {
                  var curNote = noteField.text.trim();
                  if (curNote != '') {
                    print(curNote);
                    notes.add(curNote);
                    noteField.text = '';
                    print('Note added');
                  }
                });
                var dir = await getApplicationDocumentsDirectory();
                print(dir.path);
              },
              child: Text(
                'Add note',
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
