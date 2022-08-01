import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class Todo_list {
  String title;
  String description;
  Todo_list(this.title, this.description);
}

class _HomeState extends State<Home> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  List<Todo_list> entries = [];

  void press() {
    setState(() {});
    String tit = titleController.text;
    String desc = descController.text;

    entries.add(Todo_list(tit, desc));
    // entries.add(title);
    // entries.add(description);
    print(entries[0].title);
    // print(entries[0].description);
  }

  // @override
  // void dispose() {
  //   titleController.dispose();
  //   descController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-do App'),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: press, child: Icon(Icons.add)),
      body: Column(children: [
        SizedBox(
          child: TextField(
            controller: titleController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Title'),
          ),
        ),
        SizedBox(
          child: TextField(
            controller: descController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Description'),
          ),
        ),
        ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Center(
                child: Text(
                    '${entries[index].title}, ${entries[index].description}'),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ]),
    );
  }
}
