import 'package:flutter/material.dart';
import 'package:to_do_2/style.dart';

class ToDoMainActivity extends StatefulWidget {
  const ToDoMainActivity({super.key});

  @override
  _ToDoMainActivityState createState() => _ToDoMainActivityState();
}

class _ToDoMainActivityState extends State<ToDoMainActivity> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  List<String> _items = [];
  int? _editingIndex;

  void _addOrUpdateItem() {
    final text = _textController.text;

    if (text.isEmpty) return;

    setState(() {
      if (_editingIndex == null) {
        // Adding a new item
        _items.add(text);
      } else {
        // Updating an existing item
        _items[_editingIndex!] = text;
        _editingIndex = null;
      }
      _textController.clear();
    });
  }

  void _editItem(int index) {
    setState(() {
      _textController.text = _items[index];
      _editingIndex = index;
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
      if (_editingIndex == index) {
        _textController.clear();
        _editingIndex = null;
      } else if (_editingIndex != null && _editingIndex! > index) {
        _editingIndex = _editingIndex! - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                cursorColor: Colors.green,
                controller: _textController,
                decoration: AppInputDecoration(
                  "enter your TO-DO here",
                  IconButton(
                      icon: const Icon(
                        Icons.add,color: Colors.green,size: 35,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _addOrUpdateItem();
                        }
                      }
                  ),
                ),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return 'TO-DO REQUIRED !!';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset:
                          const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.fromLTRB(5, 5, 5, 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 75,
                          child:
                          Text(" ${_items[index]}"),
                        ),
                        Expanded(
                          flex: 15,
                          child: TextButton(
                              onPressed: () {
                                _removeItem(index);
                              },
                              child: const Icon(Icons.delete,color: Colors.red,)),
                        ),
                        Expanded(
                          flex: 10,
                          child: TextButton(
                              onPressed: () {
                                _editItem(index);
                              }, child: const Icon(Icons.edit,color: Colors.green,)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}