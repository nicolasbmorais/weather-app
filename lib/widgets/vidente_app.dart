import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/theme_controller.dart';
import 'package:weather_app/widgets/home_page.dart';

class VidenteApp extends StatelessWidget {
  const VidenteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeController>(
          create: (context) => ThemeController(),
        ),
      ],
      child: AnimatedBuilder(
        animation: ThemeController.instance,
        builder: ((context, child) {
          return MaterialApp(
            title: 'Vidente',
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
            theme: ThemeController.instance.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
          );
        }),
      ),
    );
  }
}
