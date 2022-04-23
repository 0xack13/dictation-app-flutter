import 'intro_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'home_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final introDate = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    introDate.writeIfNull('displayed', false);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: introDate.read('displayed') ? const Home() : const IntroPage(),
    );
  }
}
