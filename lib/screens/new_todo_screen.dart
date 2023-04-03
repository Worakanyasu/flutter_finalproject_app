import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject_app/services/item_service.dart';
import 'package:logger/logger.dart';
import '../services/item_service.dart';

class NewTodoScreen extends StatefulWidget {
  @override
  State<NewTodoScreen> createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  final onToDoChanged = TextEditingController();

  final onDeleteTodo = TextEditingController();

  final ItemService _itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: onToDoChanged,
              decoration: InputDecoration(label: Text("Todo name")),
            ),
            TextField(
              controller: onDeleteTodo,
              decoration: InputDecoration(label: Text("Todo Description")),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: _addTodo, child: const Text("Save"))
            
          ],
        ),
      ),
    );
  }

  _addTodo() {
    _itemService.addTodo2Firebase(
        onToDoChanged.text, {"name": onToDoChanged.text, "desc": onDeleteTodo.text});
  }
}