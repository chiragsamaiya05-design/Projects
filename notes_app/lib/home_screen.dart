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
        backgroundColor: Colors.black,
        title: const Text(
            "My Notes",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: notes.isEmpty

          ? const Center(child: Text("No Notes yet"))
          : Container(
            color: Colors.black,
            child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(10,10,10,80),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,

                ),
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
            var note = notes[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(15),
              ),
             padding: const EdgeInsets.all(8),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   note['title'],

                   style: const TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 const SizedBox(height: 5),
                 Expanded(
                     child: Text(
                       note['content'],
                       style: const TextStyle(
                         color: Colors.white70,
                       ),
                       maxLines: 4,
                       overflow: TextOverflow.ellipsis,
                     ),
                 ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,

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
              ],
              ),
            );
                    },
                  ),
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
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