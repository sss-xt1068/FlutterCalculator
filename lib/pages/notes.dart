import 'package:flutter/material.dart';

class QuikNote extends StatefulWidget {
  @override
  _QuikNoteState createState() => _QuikNoteState();
}

List notes = [];
// Open the database and store the reference.

class _QuikNoteState extends State<QuikNote> {
  // final notes = List<String>.generate(5, (i) => "Note $i");
  bool darkMode = false;
  TextEditingController noteField = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkMode ? Colors.black54 : Colors.white,
      width: 280,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 4,
            child: GestureDetector(
              child: Container(
                height: 40,
                color: darkMode ? Colors.amber[300] : Colors.pink[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // darkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                      'Double tap to switch',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.settings_brightness,
                      color: darkMode ? Colors.white : Colors.black,
                    )
                  ],
                ),
              ),
              onDoubleTap: () {
                setState(() {
                  darkMode = !darkMode;
                });
              },
            ),
          ),
          Flexible(
            flex: 11,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.note,
                    color: Colors.orange[300],
                  ),
                  title: Text(
                    notes[index],
                    style: TextStyle(
                      color: darkMode? Colors.white : Colors.black
                    ),
                  ),
                );
              },
              itemCount: notes.length,
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              color: darkMode? Colors.grey[600] : Colors.white,
              height: 100,
              child: TextField(
                textAlign: TextAlign.center,
                controller: noteField,
                decoration: InputDecoration(
                  hintText: 'Type note',
                  // fillColor: Colors.white
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: MaterialButton(
              onPressed: () async {
                String curNote = noteField.text.trim();
                print(notes);
                setState(() {
                  if (curNote != '') {
                    print(curNote);
                    notes.add(curNote);
                    noteField.text = '';
                    print('Note added');
                  }
                });
              },
              child: Text(
                'Add note',
                style: TextStyle(
                  color: darkMode ? Colors.white : Colors.black,
                ),
              ),
              color: darkMode ? Colors.purple : Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
