import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TodoContainer extends StatefulWidget {
  TodoContainer({
    this.onDelete,
    super.key,
    required this.keyIndex,
  });

  VoidCallback? onDelete;

  int keyIndex;

  @override
  State<TodoContainer> createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer> {
  var box = Hive.box('todoBox');

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
                  box.get(widget.keyIndex)['text'],
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
            Row(
              children: [
                Checkbox(
                  value: box.get(widget.keyIndex)['isChecked'],
                  onChanged: (value) {
                    box.put(widget.keyIndex, {
                      'text': box.get(widget.keyIndex)['text'],
                      'isChecked': value
                    });

                    setState(() {});
                    print(widget.keyIndex);
                  },
                ),
                IconButton(
                  onPressed: () {
                    box.delete(widget.keyIndex);
                    widget.onDelete;
                    setState(() {});
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
