import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_provider.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({Key? key}) : super(key: key);

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController idController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(4, 163, 163, 1),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: idController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Please Enter ID",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Valid ID";
                    }
                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Plase Enter Title",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Valid Title";
                    }
                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: descriptionController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Please Enter Description",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Valid Description";
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                        ),
                        child: const Text(
                          "SUBMIT",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(108, 180, 177, 1),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<TodoProvider>().addTodo(
                                int.parse(idController.text),
                                nameController.text,
                                descriptionController.text);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
