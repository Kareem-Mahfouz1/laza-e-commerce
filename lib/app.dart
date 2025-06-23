import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/helpers/assets.dart';

class LazaApp extends StatelessWidget {
  const LazaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laza App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Laza Home Page')),
        body: Container(
          color: Colors.green,
          child: Center(child: SvgPicture.asset(Assets.lazaLogoSvg)),
        ),
      ),
    );
  }
}
