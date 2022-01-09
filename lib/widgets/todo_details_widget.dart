import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/data/models/todo_model.dart';
import 'package:todo/providers/todo_provider.dart';
import 'package:todo/widgets/todo_details_button.dart';
import 'package:todo/widgets/todo_edit_widget.dart';

class TodoDetailsWidget extends StatelessWidget {
  const TodoDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Todo currentTodo = context.watch<TodoProvider>().currentTodo;

    TextStyle titleStyle = const TextStyle(
        color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500);

    return Container(
      color: const Color.fromRGBO(4, 163, 163, 1),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              currentTodo.name,
              style: titleStyle,
            ),
            const SizedBox(height: 20),
            Text(
              "Todo Description",
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              currentTodo.description,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TodoDetailsButton(
                  icon: Icons.done,
                  buttonText: "Done",
                  isDone: currentTodo.isDone,
                  callback: () {
                    context
                        .read<TodoProvider>()
                        .todoDone(currentTodo.id, !currentTodo.isDone);
                  },
                ),
                TodoDetailsButton(
                  icon: Icons.edit,
                  buttonText: "Edit",
                  callback: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const EditTodoWidget();
                        });
                  },
                ),
                TodoDetailsButton(
                  icon: Icons.delete,
                  buttonText: "Delete",
                  callback: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("Are you sure?"),
                            content: Text(
                                "you are deleting a todo with title: \"${currentTodo.name}\""),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context
                                      .read<TodoProvider>()
                                      .removeTodo(currentTodo.id);
                                  Navigator.pop(context);
                                },
                                child: const Text("Yes"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No"),
                              ),
                            ],
                          );
                        }).then((value) => Navigator.pop(context));
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 120,
                  height: 40,
                  child: TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    child: const Text(
                      "SUBMIT",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(108, 180, 177, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
