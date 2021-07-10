import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/blocs/simple_bloc_observer.dart';
import 'package:flutter_todo/blocs/todos_bloc.dart';
import 'package:flutter_todo/screens/home_screen.dart';

void main() {
  // We can set a Bloc's observer to an instance of `SimpleBlocObserver`.
  // This will allow us to handle all transitions and errors in SimpleBlocObserver.
  Bloc.observer = SimpleBlocObserver();

  runApp(
    BlocProvider(
      create: (context) => TodosBloc()
        ..add(
          TodosLoaded(),
        ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ToDo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.amber,
      ),
      home: const HomeScreen(),
    );
  }
}
