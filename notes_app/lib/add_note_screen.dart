import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddNoteScreen extends StatefulWidget {
  final Map? note;
  final int? index;

  const AddNoteScreen({super.key, this.note, this.index});


  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  late Box box;
  @override
  void initState() {
    super.initState();
    box = Hive.box('notesBox');
    if (widget.note != null) {
      titleController.text = widget.note!['title'];
      contentController.text = widget.note!['content'];
    }
  }

  void saveNote() {
    String title = titleController.text.trim();
    String content = contentController.text.trim();

    if (title.isEmpty || content.isEmpty) return;
    if(widget.note == null){
    box.add({
      'title': title,
      'content': content,
    });
  }else {
  box.putAt(widget.index!, {
  'title':title,
  'content': content,
  });
  }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: contentController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "content",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveNote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.black,
                ),
                child: Text(" Save"),

              )
            ],
          ),
      ),
    );
  }
}
