import 'package:flutter/material.dart';
import 'package:plant_disease/dashboard.dart';
import 'package:plant_disease/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ValueKey? _currentRoute = DashboardPage.valueKey;

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
                .headline5!
                .copyWith(fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
              child: DashboardPage(
                title: 'Dashboard',
                updateRoute: () {
                  _setCurrentRoute(DetailsPage.valueKey);
                },
              ),
              key: DashboardPage.valueKey),
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
