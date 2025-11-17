import 'package:flutter_project_1/model/todo_items.dart';

class TodoListViewModel {
  List<TodoItems> _items = [];

  // Getter (외부에서 _items 접근 가능)
  List<TodoItems> get items => _items;

  // 비즈니스 로직 - 할 일 추가
  void addItem(String title) {
    _items.add(TodoItems(title: title));
  }

  // 비즈니스 로직 - 완료 상태 변경
  void toggleItem(TodoItems todo) {
    todo.isDone = !todo.isDone;
  }
}
