import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_controller.dart' as MyCarouselController;


class CpanelPhpConnection extends StatefulWidget {
  const CpanelPhpConnection({super.key});

  //final String title;

  @override
  State<CpanelPhpConnection> createState() => _CpanelPhpConnectionState();
}

class _CpanelPhpConnectionState extends State<CpanelPhpConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title!),
       // centerTitle: true,
      ),
    );
  }

  Future getData() async{
    var url = Uri.parse('https://centrose.online/get.php');
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    print(data.toString());
  }

  @override
  void initState() {
    getData();
  }
}
