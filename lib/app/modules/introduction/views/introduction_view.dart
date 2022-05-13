import 'package:alquran_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Al-qur'an Apps",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Al-qur'an Apps is a mobile application that provides you with the latest information about the Holy Quran.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: Lottie.asset('assets/lottie/introduction.json'),
          ),
          ElevatedButton(
            child: const Text(
              'Get Started',
              style: TextStyle(fontSize: 16),
            ),
            onPressed: () => Get.offAllNamed(Routes.HOME),
          )
        ],
      )),
    );
  }
}
