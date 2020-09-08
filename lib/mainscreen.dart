import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gift/infoscreen.dart';
import 'package:gift/model/alldata.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gift cards',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.solidBell,
                      size: 18.0,
                    ),
                    onPressed: () => print('Bell Pressed')),
              ],
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search Here', border: OutlineInputBorder()),
              style: TextStyle(),
            ),
            SizedBox(height: 40.0),
            Text(
              'Recommended',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22.0,
                letterSpacing: 0.1,
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: datalist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (MediaQuery.of(context).size.width) /
                        (MediaQuery.of(context).size.height / 1.2),
                  ),
                  itemBuilder: (context, index) {
                    return CardView(
                      obj: datalist[index],
                    );
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        elevation: 2.0,
        currentIndex: _currentIndex,
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.creditCard,
              color: Colors.grey,
              size: 20.0,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.creditCard,
              color: Colors.blue,
              size: 20.0,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.users,
              color: Colors.grey,
              size: 20.0,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.users,
              color: Colors.blue,
              size: 20.0,
            ),
            title: Text(
              'Friends',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.redo,
              color: Colors.grey,
              size: 20.0,
            ),
            title: Text(
              'Redeem',
              style: TextStyle(color: Colors.blue),
            ),
            activeIcon: Icon(
              FontAwesomeIcons.redo,
              color: Colors.blue,
              size: 20.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.toggleOff,
              size: 20.0,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.toggleOff,
              size: 20.0,
              color: Colors.blue,
            ),
            title: Text(
              'Setting',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

class CardView extends StatelessWidget {
  final AllData obj;
  const CardView({
    this.obj,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => InfoScreen(data: obj))),
      child: Card(
          color: obj.bgcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 44.0,
                right: 13.0,
                child: Opacity(
                  opacity: 0.4,
                  child: Hero(
                    tag: obj.imageUrl,
                    child: Image(
                      image: AssetImage('${obj.imageUrl}'),
                      height: 180.0,
                      width: 180.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      obj.icon,
                      color: Colors.white,
                      size: 22.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${obj.name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Container(
                          width: 20.0,
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '${obj.price}',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 3.0),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
