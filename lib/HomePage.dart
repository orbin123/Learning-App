import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/body.dart';

import 'package:flutter_application_1/components/API_Body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            Body(),
            ApiBody(),
          ],
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: const Icon(Icons.menu),
      actions: const [
        Icon(Icons.message),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.notifications),
        ),
      ],
      backgroundColor: Color(0xEEF3FD),
    );
  }
}
