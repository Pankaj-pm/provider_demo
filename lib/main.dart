import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/home/provider/counter_provider.dart';
import 'package:provider_demo/home/provider/platform_provider.dart';
import 'package:provider_demo/home/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlatformProvider(),
        ),
      ],
      builder: (context, child) {
        var isAndroid = Provider.of<PlatformProvider>(context).isAndroid;
        return isAndroid
            ? MaterialApp(
                home: HomePage(),
              )
            : CupertinoApp(
                home: HomePage(),
              );
      },
    );
  }
}
