import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:plant_disease/screens/camera.dart';
import 'package:plant_disease/configs/apptheme.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Disease',
      theme: appTheme,
      home: CameraPage(
        title: "Camera",
        cameras: _cameras,
        updateRoute: () {},
      ),
    );
  }
}
