import 'package:flutter/material.dart';
class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController todoController = TextEditingController();
  final todoKey = GlobalKey<FormState>();
  String? selectedDate;
  List<Map<String, dynamic>> daftarTodo = [];

  void addTodo() {
    if (selectedDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select a date')));
      return;
    }

    if (todoController.text.isNotEmpty) {
      setState(() {
        daftarTodo.add({
          'task': todoController.text,
          'deadline': selectedDate,
          'isDone': false,
        });
        todoController.clear();
        selectedDate = null;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Task Date:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1,),
              ),
              Row(
                children: [
                  Expanded(
                    child: SelectableText(
                      selectedDate ?? 'Select a date',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.calendar_today, color: Colors.blue),
                  ),
                ],
              ),

              SizedBox(height: 5),
              Form(
                key: todoKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: todoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        decoration: InputDecoration(
                          labelText: 'Task Name',
                          hintText: 'Enter task name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
