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
    setState(() {
      String tit = titleController.text;
      String desc = descController.text;

      entries.add(Todo_list(tit, desc));
      print(entries[0].title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-do App'),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: press, child: Icon(Icons.add)),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: SizedBox(
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Title'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: SizedBox(
            child: TextField(
              controller: descController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Description'),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: entries.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Item ${index + 1}:',
                          style: TextStyle(color: Colors.blueGrey[300]),
                          textScaleFactor: 3),
                      Text('${entries[index].title}',
                          style: TextStyle(color: Colors.blue),
                          textScaleFactor: 2),
                      Text('${entries[index].description}',
                          style: TextStyle(color: Colors.blueGrey),
                          textScaleFactor: 1),
                    ]),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: Colors.blueAccent, thickness: 5),
          ),
        ),
      ]),
    );
  }
}
