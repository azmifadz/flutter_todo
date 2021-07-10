import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  final bool? complete;
  final String? id;
  final String? title;
  final DateTime? startDate;
  final DateTime? endDate;

  const Todo({
    this.complete = false,
    this.id,
    this.title,
    this.startDate,
    this.endDate,
  });

  Todo copyWith(
      {bool? complete, String? title, DateTime? startDate, DateTime? endDate}) {
    return Todo(
      complete: complete ?? this.complete,
      id: id ?? const Uuid().v4(),
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  List<Object?> get props => [complete, id, title, startDate, endDate];

  @override
  String toString() {
    return 'Todo { complete: $complete, id: $id, title: $title, startDate: $startDate, endDate: $endDate }';
  }
}
