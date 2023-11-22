import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_application/views/home_screen/widgets/todo_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    keysList = box.keys.toList();
    // subKeyList = box.keys.toList();
    print(keysList);

    // TODO: implement initState
    super.initState();
  }

  var box = Hive.box('myBox');

  List keysList = [];
  List valuesList = [];
  // List subKeyList = [];

  final titleController = TextEditingController();
  // final subTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 0),
        itemCount: keysList.length,
        itemBuilder: (context, index) => TodoContainer(
          title: keysList[index],
          // subTitle: subKeyList[index],
          checkValue: false,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "todo",
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: TextFormField(
                  //     // controller: subTitleController,
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //     ),
                  //   ),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      if (titleController.text.trim().isNotEmpty) {
                        box.add(titleController.text.trim());
                        // box.add(subTitleController.text.trim());
                        keysList = box.keys.toList();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("enter any value"),
                          ),
                        );
                      }

                      // subKeyList = box.keys.toList();
                      setState(() {});
                      titleController.clear();
                      Navigator.pop(context);
                    },
                    child: Text("add"),
                  ),
                ],
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
