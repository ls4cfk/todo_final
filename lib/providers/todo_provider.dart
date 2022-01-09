import 'package:flutter/material.dart';
import 'package:todo/data/models/todo_model.dart';
import 'package:todo/data/repo/todo_repo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todoList = [];
  late Todo currentTodo;
  TodoRepository todoRepo = TodoRepository();

  TodoProvider() {
    getTodoList();
  }

  Future<void> removeTodo(todoId) async {
    await todoRepo.removeTodo(todoId);
    getTodoList();
  }

  changeCurrentTodo(Todo todo) {
    currentTodo = todo;
    getTodo(todo.id);
  }

  Future<void> todoDone(todoId, isDone) async {
    await todoRepo.todoDone(todoId, isDone);
    getTodo(todoId);
    getTodoList();
  }

  Future<void> updateTodo(id, name, isDone, description) async {
    await todoRepo.updateTodo(id, name, isDone, description);
    getTodoList();
    getTodo(id);
  }

  Future<void> addTodo(int id, String name, String description) async {
    await todoRepo.addTodo(id, name, false, description);
    getTodoList();
  }

  Future<void> getTodoList() async {
    todoList = (await todoRepo.getTodoList())!;
    notifyListeners();
  }

  Future<void> getTodo(int id) async {
    currentTodo = (await todoRepo.getTodo(id))!;
    notifyListeners();
  }
}
