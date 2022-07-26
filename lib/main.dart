import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:plant_disease/camera.dart';
import 'package:plant_disease/details.dart';

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
  ValueKey? _currentRoute = CameraPage.valueKey;

  void _setCurrentRoute(ValueKey? valueKey) {
    setState(() {
      _currentRoute = valueKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Disease',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
              child: CameraPage(
                title: 'Camera',
                updateRoute: () {
                  _setCurrentRoute(DetailsPage.valueKey);
                },
                cameras: _cameras,
              ),
              key: CameraPage.valueKey),
          if (_currentRoute == DetailsPage.valueKey)
            const MaterialPage(child: DetailsPage(title: "Details"))
        ],
        onPopPage: ((route, result) {
          _setCurrentRoute(null);
          return route.didPop(result);
        }),
      ),
    );
  }
}
