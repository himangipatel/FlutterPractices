import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    Color color = Theme
        .of(context)
        .primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(context, color, Icons.call, 'CALL'),
          _buildButtonColumn(context, color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(context, color, Icons.share, 'SHARE'),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
          title: Text('Flutter layout demo'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              tooltip: 'Search',
              onPressed: null,
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/hall_1.jpg',
                image: 'https://picsum.photos/250?image=9',
                fit: BoxFit.cover,
                width: 500,
                height: 400,
              ),
//            Image.network(
//              'https://picsum.photos/250?image=9',
//              fit: BoxFit.cover,
//              width: 500,
//              height: 400,
//            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    )
    ;
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Expanded Column Sample'),
//      ),
//      body: Center(
//        child: Column(
//          children: <Widget>[
//            Container(
//              color: Colors.red,
//              height: 100,
//              width: 100,
//            ),
//            Expanded(
//              child: Container(
//                color: Colors.blue,
//                width: 100,
//              ),
//            ),
//            Container(
//              color: Colors.red,
//              height: 100,
//              width: 100,
//            ),
//          ],
//        ),
//      ),
//    );
  }

  Column _buildButtonColumn(BuildContext context, Color color, IconData icon,
      String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon, color: color),
          onPressed: null
          ,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.call,
                  color: Colors.blue[500],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(
                      'CALL',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue[500]),
                    ))
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.near_me,
                  color: Colors.blue[500],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    'ROUTE',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue[500]),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.share,
                  color: Colors.blue[500],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(
                      'SHARE',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue[500]),
                    ))
              ],
            ),
          )
        ],
      ));
}
