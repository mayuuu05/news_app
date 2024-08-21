import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    // Timer(const Duration(seconds:3),(){
    //   Navigator.of(context).pushReplacementNamed('/intro');
    // });
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient:
          RadialGradient(center: Alignment.topLeft, radius: 1,colors: [
            Color(0xff32343b),
            Color(0xff1c1e22),
          ]),
        ),alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height*0.3,),
            Text('MODERN NEWS',style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w200,letterSpacing: 3,wordSpacing: 2
            ),),
            SizedBox(height: height*0.03,),
            GestureDetector(
              onTap: () {
                Get.offAllNamed('/login');
              },
              child: Container(

                height: 45,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                  )
                ),
                alignment: Alignment.center,
                child: Text('Get started',style: TextStyle(color: Colors.grey,fontSize: 17),),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Image.asset('assets/images/Screenshot_2024-08-13_193713-removebg-preview.png',height: 350,)),
            ),

          ],
        ),
      ),
    );
  }
}
