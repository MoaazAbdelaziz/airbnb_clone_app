import 'package:airbnb_clone_app/features/home/presention/views/home_view.dart';
import 'package:airbnb_clone_app/injectables.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(
    DevicePreview(
      builder: (context) => const Airbnb(),
      enabled: true,
    ),
  );
}

class Airbnb extends StatelessWidget {
  const Airbnb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
