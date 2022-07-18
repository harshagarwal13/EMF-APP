import 'package:emf_app/models/magnitudeprovider.dart';
import 'package:emf_app/pages/visuals.dart';
import 'package:emf_app/utils/colors.dart';
import 'package:emf_app/widgets/mainreading.dart';
import 'package:emf_app/widgets/meterreading.dart';
import 'package:emf_app/widgets/xyzreading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MainReading(),
            XYZReading(),
            MeterReading(),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Colors.white))),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.primaryColor),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Visuals()));
                },
                child: Text('Visualize'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Consumer<MagnitudeProvider>(
                builder: (context, model, child) => Container(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  side: BorderSide(color: Colors.white))),
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryColor),
                        ),
                        onPressed: () {
                          model.changeValues();
                        },
                        child: Text('Start'),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
