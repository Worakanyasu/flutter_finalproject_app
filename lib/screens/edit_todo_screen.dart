import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/item_service.dart';


class EditTodoScreen extends StatefulWidget {
  late String documentid;
  final _todoName = TextEditingController();
  final _todoDesc = TextEditingController();
  EditTodoScreen(String documentid, String todoname, String tododesc) {
    documentid = documentid;
    _todoName.text = todoname;
    _todoDesc.text = tododesc;
  }

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  final ItemService _itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: widget._todoName,
              decoration: const InputDecoration(label: Text("Todo name")),
              readOnly: true,
            ),
            TextField(
              controller: widget._todoDesc,
              decoration:
                  const InputDecoration(label: Text("Todo Description")),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: _deleteTodo, child: const Text("Delete")),
            ),
            ElevatedButton(onPressed: _editTodo, child: const Text("Edit"))
          ],
        ),
      ),
    );
  }

  void _editTodo() {
    _itemService.editItem(widget._todoName.text,
        {"name": widget._todoName.text, "desc": widget._todoDesc.text});
  }

  void _deleteTodo() {
    _itemService.deleteItem(widget._todoName.text);
  }
}