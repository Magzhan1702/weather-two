import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Weather", style: TextStyle(fontSize: 23)),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: Column(
        children: <Widget>[
          _headerImage(),
          _weatherDescription(),
          _temperature(),
          Divider(),
          _temperatureForecast(),
          Divider(),
          _footer(),
        ],
      ),
    ),
  );
}

Widget _headerImage() {
  return Image(
    image: NetworkImage('https://picsum.photos/800/400'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "MONDAY - SEPT 14",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      Divider(),

      Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at",
      ),
      Divider(),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        children: <Widget>[
          Icon(Icons.sunny, color: Colors.amberAccent, size: 50),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("15 Clear"), Text("Lorem Ipsum is  industry")],
      ),
      Divider(),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text('${index + 20} C', style: TextStyle(fontSize: 20)),
        avatar: Icon(Icons.cloud, color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Colors.blueGrey),
        ),
      );
    }),
  );
}

Row _footer() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      const Icon(Icons.star, size: 15.0, color: Colors.black),
      const Icon(Icons.star, size: 15.0, color: Colors.black),
    ],
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const Text(
        'Info with openweathermap.org',
        style: TextStyle(fontSize: 15.0),
      ),
      stars,
    ],
  );
}