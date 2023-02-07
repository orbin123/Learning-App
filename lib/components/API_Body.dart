import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../api_data/items.dart';

class ApiBody extends StatefulWidget {
  const ApiBody({super.key});

  @override
  State<ApiBody> createState() => _ApiBodyState();
}

class _ApiBodyState extends State<ApiBody> {
  @override
  void initState() {
    super.initState();
    final futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Album>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Text(snapshot.data!.title),
                Text(snapshot.data!.id.toString()),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
