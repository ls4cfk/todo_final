class Todo {
  int id;
  String name;
  bool isDone;
  String description;

  Todo(
      {required this.id,
      required this.name,
      required this.isDone,
      required this.description});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json["id"],
        name: json["todo"],
        isDone: json["isDone"],
        description: json["description"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["todo"] = name;
    data["isDone"] = isDone;
    data["description"] = description;
    return data;
  }
}
