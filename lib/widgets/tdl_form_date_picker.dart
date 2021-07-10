import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/date_time_helper.dart';

class TdlFormDatePicker extends StatefulWidget {
  const TdlFormDatePicker(
      {required this.onSelectedDate, this.selectedDate, Key? key})
      : super(key: key);

  final Function(DateTime) onSelectedDate;
  final DateTime? selectedDate;

  @override
  _TdlFormDatePickerState createState() => _TdlFormDatePickerState();
}

class _TdlFormDatePickerState extends State<TdlFormDatePicker> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.selectedDate != null) {
      textEditingController.text = DateTimeHelper()
          .dateFilterDisplayDateFormat()
          .format(widget.selectedDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: TextFormField(
        controller: textEditingController,
        enabled: false,
        decoration: const InputDecoration(
            suffixIcon: Icon(Icons.arrow_drop_down),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            hintText: 'Select a Date'),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        textEditingController.text =
            DateTimeHelper().dateFilterDisplayDateFormat().format(picked);
        widget.onSelectedDate(picked);
      });
    }
  }
}
