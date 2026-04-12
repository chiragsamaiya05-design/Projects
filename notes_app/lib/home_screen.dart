import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'add_note_screen.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box box;

  @override

  void initState(){
    super.initState();
    box = Hive.box('notesBox');
  }
  @override
  Widget build(BuildContext context) {
    var notes = box.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("My Notes"),
        centerTitle: true,
      ),
      body: notes.isEmpty
        ? Center(child: Text("NO Notes yet"))
        : ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context,index) {
            var note = notes[index];

            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(note['title']),
                subtitle: Text(note['content']),
                trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red,),
                    onPressed: (){
                        box.deleteAt(index);
                        setState(() {});
              },
              ),
            ),
            );

          },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (_)=>AddNoteScreen()),
        );
        setState(() {});
      },
      child: Icon(Icons.add),
      ),
    );

  }
}
