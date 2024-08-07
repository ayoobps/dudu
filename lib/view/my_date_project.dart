import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MyDateProject extends StatefulWidget {
  const MyDateProject({super.key});

  @override
  State<MyDateProject> createState() => _MyDateProjectState();
}

class _MyDateProjectState extends State<MyDateProject> {
  TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Datepicker")),
        body: Container(
            padding:const EdgeInsets.all(15),
            height:150,
            child:Center(
                child:TextField(

                  controller: dateController, //editing controller of this TextField
                  decoration: const InputDecoration(

                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Choose Date" //label text of field
                  ),
                  readOnly: true,  // when true user cannot edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime(1900), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100)
                    );

                    if(pickedDate != null ){
                      print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(formattedDate); //formatted date output using intl package =>  2022-07-04
                      //You can format date as per your need

                      setState(() {
                        dateController.text = formattedDate; //set formatted date to TextField value.
                      });
                    }else{
                      print("Date is not selected");
                    }
                  },
                )
            )
        ));
  }
}
