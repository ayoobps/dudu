import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ProjectSensor extends StatefulWidget {
  const ProjectSensor({super.key});

  @override
  State<ProjectSensor> createState() => _ProjectSensorState();
}

class _ProjectSensorState extends State<ProjectSensor> {
  List<AccelerometerEvent> _accelerometerValues = [];

  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;

  @override
  void initState(){
    super.initState();

    _accelerometerSubscription = accelerometerEvents.listen((event){
      setState(() {
        _accelerometerValues = [event];
      });
    });
  }

  @override
  void dispose(){
    _accelerometerSubscription.cancel();
    FontFeature.superscripts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accelerometer Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Accelerometer Data:',
            style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10.h),
            if(_accelerometerValues.isNotEmpty)
              Text(
                'X: ${_accelerometerValues[0].x.toStringAsFixed(2)},'
                    'Y: ${_accelerometerValues[0].y.toStringAsFixed(2)},'
                    'Z: ${_accelerometerValues[0].z.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16)

              ),
          ],
        ),
      ),
    );
  }
}
