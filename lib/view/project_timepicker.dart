import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Project_Timepicker extends StatefulWidget {
  const Project_Timepicker({Key? key}) : super(key: key);

  @override
  State<Project_Timepicker> createState() => _Project_TimepickerState();
}

class _Project_TimepickerState extends State<Project_Timepicker> {
  TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    timeController.text = ""; // Set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Timepicker")),
      body: Container(
        padding: const EdgeInsets.all(15),
        height: 150,
        child: Center(
          child: TextField(
            controller: timeController, // Editing controller of this TextField
            decoration: const InputDecoration(
              icon: Icon(Icons.access_time), // Icon of text field
              labelText: "Enter Time", // Label text of field
            ),
            readOnly: true, // When true, user cannot edit text
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(), // Get current time
              );

              if (pickedTime != null) {
                // Format time as HH:mm
                final now = DateTime.now();
                final pickedDateTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  pickedTime.hour,
                  pickedTime.minute,
                );
                String formattedTime = DateFormat('HH:mm').format(pickedDateTime);

                print(pickedTime); // Output time as TimeOfDay
                print(formattedTime); // Formatted time output using intl package => 14:30

                setState(() {
                  timeController.text = formattedTime; // Set formatted time to TextField value
                });
              } else {
                print("Time is not selected");
              }
            },
          ),
        ),
      ),
    );
  }
}