import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/blocs/todos_bloc.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/widgets/tdl_form_date_picker.dart';
import 'package:flutter_todo/widgets/tdl_form_text_field.dart';
import 'package:flutter_todo/widgets/tdl_form_title_text.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key, this.todo}) : super(key: key);

  final Todo? todo;

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  late Todo _todo;
  bool isNewTodo = true;

  @override
  void initState() {
    super.initState();

    if (widget.todo != null) {
      isNewTodo = false;
      _todo = widget.todo!;
    } else {
      _todo = const Todo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new To-Do List'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 24),
                const TdlFormTitleText(title: 'To-Do Title'),
                const SizedBox(height: 8),
                TdlFormTextField(
                  hintText: 'Please key in your To-Do title here',
                  onTextChanged: (value) => _todo = _todo.copyWith(
                    title: value,
                  ),
                  initialValue: _todo.title,
                ),
                const SizedBox(height: 24),
                const TdlFormTitleText(title: 'Start Date'),
                const SizedBox(height: 8),
                //Start Date Picker
                TdlFormDatePicker(
                  onSelectedDate: (value) => _todo = _todo.copyWith(startDate: value),
                  selectedDate: _todo.startDate,
                ),
                const SizedBox(height: 24),
                const TdlFormTitleText(title: 'Estimated End Date'),
                const SizedBox(height: 8),
                //End Date Picker
                TdlFormDatePicker(
                  onSelectedDate: (value) => _todo = _todo.copyWith(endDate: value),
                  selectedDate: _todo.endDate,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: TextButton(
            onPressed: () {
              if (isNewTodo) {
                BlocProvider.of<TodosBloc>(context).add(
                  TodoAdded(_todo),
                );
              } else {
                BlocProvider.of<TodosBloc>(context).add(
                  TodoUpdated(_todo),
                );
              }

              Navigator.pop(context);
            },
            child: Text(
              isNewTodo ? 'Create Now' : 'Update',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
