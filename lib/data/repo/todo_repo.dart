import 'package:dio/dio.dart';
import 'package:todo/data/models/todo_model.dart';

class TodoRepository {
  Dio dio = Dio();
  List<Todo>? todoList = [];

  Future<Todo>? getTodo(id) async {
    final resp = await dio.get('http://10.0.2.2:8080/todo/$id');
    late Todo tempTodo;

    if (resp.statusCode == 200) {
      tempTodo = Todo.fromJson(resp.data);
    }

    return tempTodo;
  }

  Future<List<Todo>?> getTodoList() async {
    final resp = await dio.get('http://10.0.2.2:8080/todos');
    if (resp.statusCode == 200) {
      var tempTodo = <Todo>[];
      resp.data.forEach((todo) {
        Todo todoModel = Todo.fromJson(todo);
        tempTodo.add(todoModel);
        todoList = tempTodo;
        return todoList;
      });
    }
    return todoList;
  }

  Future<void>? removeTodo(todoId) async {
    await dio.delete('http://10.0.2.2:8080/delete-todo/$todoId');
  }

  Future<Todo>? addTodo(id, name, isDone, description) async {
    Todo todo =
        Todo(id: id, name: name, isDone: isDone, description: description);
    final resp =
        await dio.post('http://10.0.2.2:8080/add-todo', data: todo.toJson());
    if (resp.statusCode == 200) {
      var tempTodo = Todo.fromJson(resp.data);
      todoList!.add(tempTodo);
      return todo;
    }
    return todo;
  }

  Future<String>? todoDone(id, isDone) async {
    final resp = await dio
        .patch('http://10.0.2.2:8080/todo-done/$id', data: {"isDone": isDone});
    if (resp.statusCode == 200) {
      todoList![todoList!.indexWhere((element) => element.id == id)].isDone =
          isDone;
      return resp.data;
    }
    return resp.data;
  }

  Future<Todo>? updateTodo(id, name, isDone, description) async {
    Todo todo =
        Todo(id: id, name: name, isDone: isDone, description: description);

    final resp =
        await dio.put('http://10.0.2.2:8080/update-todo', data: todo.toJson());
    if (resp.statusCode == 200) {
      todoList![todoList!.indexWhere((element) => element.id == id)] = todo;
      return todo;
    }
    return todo;
  }
}
