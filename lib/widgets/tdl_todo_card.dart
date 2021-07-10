import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/utils/date_time_helper.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({required this.todo, Key? key}) : super(key: key);

  final Todo todo;

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool checked = false;

  @override
  void initState() {
    super.initState();

    if (widget.todo.complete != null) {
      checked = widget.todo.complete!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: Text(
                widget.todo.title!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .merge(const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CardItemColumn(
                      title: 'Start Date',
                      value: widget.todo.startDate != null
                          ? DateTimeHelper()
                              .dateFilterDisplayDateFormat()
                              .format(widget.todo.startDate!)
                          : '',
                    ),
                    _CardItemColumn(
                      title: 'End Date',
                      value: widget.todo.endDate != null
                          ? DateTimeHelper()
                              .dateFilterDisplayDateFormat()
                              .format(widget.todo.endDate!)
                          : '',
                    ),
                    _CardItemColumn(
                      title: 'Time left',
                      value: widget.todo.endDate != null
                          ? DateTimeHelper()
                          .getTimeRemaining(endDate: widget.todo.endDate!)
                          : '--',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: const Color(0xffe8e2d0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    const Text('Status:'),
                    const SizedBox(width: 4),
                    Text(
                      getStatusBasedOnCheckBox(isChecked: checked),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Expanded(child: SizedBox()),
                    const Text('Tick if completed'),
                    const SizedBox(width: 4),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: checked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            checked = newValue!;
                            widget.todo.copyWith(complete: newValue);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getStatusBasedOnCheckBox({required bool isChecked}) {
    return isChecked ? 'Completed' : 'Incomplete';
  }
}

class _CardItemColumn extends StatelessWidget {
  const _CardItemColumn({required this.title, required this.value, Key? key})
      : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(
            height: 4,
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
