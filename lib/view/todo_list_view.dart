import 'package:flutter/material.dart';
import 'package:flutter_project_1/model/todo_items.dart';
import 'package:flutter_project_1/viewmodel/todo_list_viewmodel.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  TextEditingController _controller = TextEditingController();
  final TodoListViewModel _viewModel = TodoListViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // ✅ Flexible 대신 Scaffold 사용
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(  // ✅ 이제 Column이 최상위
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter todo item...',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _viewModel.addItem(_controller.text);
                      _controller.clear();
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(  // ✅ Expanded는 Column의 자식이므로 정상
            child: ListView.builder(
              itemCount: _viewModel.items.length,
              itemBuilder: (context, index) {
                final TodoItems item = _viewModel.items[index];
                return ListTile(
                  title: Text(item.title),
                  trailing: Checkbox(
                    value: item.isDone,
                    onChanged: (value) {
                      setState(() {
                        _viewModel.toggleItem(item);
                      });
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
