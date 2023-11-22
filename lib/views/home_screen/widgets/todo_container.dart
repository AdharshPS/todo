import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TodoContainer extends StatefulWidget {
  TodoContainer({
    super.key,
    required this.title,
    // required this.subTitle,
    required this.checkValue,
  });

  int title;
  // int subTitle;
  bool checkValue;

  @override
  State<TodoContainer> createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer> {
  var box = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // box.get(widget.title),
                  box.get(widget.title),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Text(
                //   box.get(widget.subTitle),
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
              ],
            ),
            Checkbox(
              value: widget.checkValue,
              onChanged: (value) {
                widget.checkValue = value!;
                print(box.get(widget.title));

                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
