part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {}

class TodosLoadSuccess extends TodosState {
  final List<Todo> todos;

  const TodosLoadSuccess({this.todos = const []});

  TodosLoadSuccess copyWith({
    required List<Todo> todos,
  }) {
    return TodosLoadSuccess(
      todos: todos,
    );
  }

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosLoadSuccess { todos: $todos }';
}

class TodosLoadFailure extends TodosState {}