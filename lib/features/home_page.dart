import 'package:flutter/material.dart';
import 'package:thousand_it_test/features/news_page.dart';
import 'package:thousand_it_test/widgets/landscape_widget.dart';
import 'package:thousand_it_test/widgets/orientation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.withOpacity(0.5),
      appBar: AppBar(
        title: const Text("News"),
        centerTitle: true,
        backgroundColor: const Color(0xff253B49),
      ),
      body: const OrientationWidget(
        portrait: NewsPage(),
        landscape: LandscapeWidget(),
      ),
    );
  }
}
