import 'dart:math';
import 'package:flutter/material.dart';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:vector_math/vector_math_64.dart';

class MagnitudeProvider extends ChangeNotifier {
  double x = 0;
  double y = 0;
  double z = 0;
  double magnitude = 0;
  int time = 0;
  List<LiveData> values = [];
  Vector3 _magnetometer = Vector3.zero();
  Vector3 _accelerometer = Vector3.zero();
  Vector3 _absoluteOrientation2 = Vector3.zero();
  int? groupvalue = 2;
  changeValues() {
    motionSensors.magnetometer.listen((MagnetometerEvent event) {
      _magnetometer.setValues(event.x, event.y, event.z);
      var matrix =
          motionSensors.getRotationMatrix(_accelerometer, _magnetometer);
      _absoluteOrientation2.setFrom(motionSensors.getOrientation(matrix));
      x = _magnetometer.x;
      y = _magnetometer.y;
      z = _magnetometer.z;
      magnitude = sqrt((pow(_magnetometer.x, 2)) +
          (pow(_magnetometer.y, 2)) +
          (pow(_magnetometer.z, 2)));
      values.add(LiveData(x, y, z, time++));
      if (values.length > 40) {
        values.removeAt(0);
      }
      notifyListeners();
    });
  }

  setUpdateIntervals(int? groupValue, int interval) {
    motionSensors.magnetometerUpdateInterval = interval;
    groupvalue = groupValue;
    print(groupvalue);
    notifyListeners();
  }
}

class LiveData {
  LiveData(this.x, this.y, this.z, this.time);
  final double x;
  final double y;
  final double z;
  final int time;
}
