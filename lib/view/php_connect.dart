import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> students = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://obeyinternational.com/flutter_api/db.php'));
    if (response.statusCode == 200) {
      setState(() {
        students = jsonDecode(response.body);
      });
    } else {
      // Handle error
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Data'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index]['name']),
            subtitle: Text(students[index]['roll_number']),
          );
        },
      ),
    );
  }
}
