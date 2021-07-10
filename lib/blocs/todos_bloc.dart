import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/models/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosInitial());

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    final currentState = state;

    if (event is TodosLoaded) {
      yield const TodosLoadSuccess();
    }

    if (event is TodoAdded) {
      if (currentState is TodosLoadSuccess) {
        final List<Todo> updatedTodos =
            List.from((state as TodosLoadSuccess).todos)..add(event.todo);
        yield currentState.copyWith(todos: updatedTodos);
      }
    }

    if (event is TodoUpdated) {
      if (currentState is TodosLoadSuccess) {
        final List<Todo> updatedTodos =
            (state as TodosLoadSuccess).todos.map((todo) {
          return todo.id == event.todo.id ? event.todo : todo;
        }).toList();

        yield currentState.copyWith(todos: updatedTodos);
      }
    }
  }
}
