import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todo/data/models/todo_model.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:todo/widgets/todo_details_widget.dart';

class TodoItem extends StatelessWidget {
  final int id;
  final String name;
  final String description;
  final bool isDone;

  const TodoItem(
      {Key? key,
      required this.id,
      required this.name,
      required this.description,
      required this.isDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(
            name,
            style: const TextStyle(fontSize: 22),
          ),
          subtitle: Text(description),
          textColor: Colors.black,
          trailing: Container(
            decoration: BoxDecoration(
                color: isDone ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(40)),
            child: IconButton(
              onPressed: () {
                context.read<TodoProvider>().todoDone(id, !isDone);
              },
              icon: const Icon(Icons.done),
              color: Colors.white,
            ),
          ),
          onLongPress: () {
            Todo editTodo = Todo(
                id: id, name: name, isDone: isDone, description: description);
            context.read<TodoProvider>().changeCurrentTodo(editTodo);
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const TodoDetailsWidget();
                });
          },
        ),
      ),
    );
  }
}
