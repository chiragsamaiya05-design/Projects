import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'add_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('notesBox');

  }

  @override
  Widget build(BuildContext context) {
    var notes = box.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
        centerTitle: true,
      ),
      body: notes.isEmpty
          ? const Center(child: Text("No Notes yet"))
          : ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          var note = notes[index];

          return Card(
            margin: const EdgeInsets.fromLTRB(2,4,2,4),
            child: ListTile(
              title: Text(note['title']),
              subtitle: Text(note['content']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddNoteScreen(
                            note: note,
                            index: index,
                          ),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      box.deleteAt(index);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddNoteScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}