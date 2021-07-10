import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/blocs/todos_bloc.dart';
import 'package:flutter_todo/screens/todo_screen.dart';
import 'package:flutter_todo/widgets/tdl_todo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[300],
          child: BlocBuilder<TodosBloc, TodosState>(
            builder: (context, state) {
              if (state is TodosLoadSuccess) {
                final todos = state.todos;

                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => _navigateToPage(
                          context,
                          TodoScreen(
                            todo: todos[index],
                          )),
                      child: TodoCard(
                        todo: todos[index],
                      ),
                    );
                  },
                );
              }

              return const Text('Oops! Something went wrong');
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToPage(context, const TodoScreen()),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future _navigateToPage(context, routeWidget) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => routeWidget),
    );
  }
}
