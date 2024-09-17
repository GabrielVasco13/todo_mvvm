class TodoModel {
  int id;
  String title;
  bool isChecked;

  TodoModel({
    required this.id,
    required this.title,
    required this.isChecked,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      isChecked: json['isChecked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isChecked': isChecked,
    };
  }
}
