// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utilities.dart';

class CardItem {
  final String image1;
  final String title;
  const CardItem({
    required this.image1,
    required this.title,
  });
}

class Body extends StatelessWidget {
  List<CardItem> items = [
    CardItem(
        image1: breastFeeding,
        title: "A complete guide for your new born baby"),
    CardItem(image1: family, title: "Understanding of human behaviour")
  ];

  Widget buildCard({required CardItem item}) => Container(
      width: 200,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.asset(
                item.image1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            item.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget selectedExtras({required String image2, required String name}) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image2))),
            ),
            SizedBox(height: 10),
            Text(name, style: TextStyle(fontSize: 17)),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            children: const [
              Text("Hello, Priya!"),
              Text("What do you wanna learn today?")
            ],
          ),
        ),
      ),
      Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 8,
              right: 8,
            ),
            child: Container(
                height: 180,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2.50,
                  children: [
                    selectedExtras(image2: programs, name: "Programs"),
                    selectedExtras(image2: getHelp, name: "Get Help"),
                    selectedExtras(image2: learn, name: "Learn"),
                    selectedExtras(image2: ddTracker, name: "DD Tracker")
                  ],
                )),
          )
        ]),
      ),
      SizedBox(height: 10),
      Container(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            separatorBuilder: (context, _) => SizedBox(width: 12),
            itemBuilder: (context, index) => buildCard(
              item: items[index],
            ),
          ))
    ]);
  }
}
