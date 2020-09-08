import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:gift/model/alldata.dart';

class InfoScreen extends StatefulWidget {
  final AllData data;

  const InfoScreen({Key key, this.data}) : super(key: key);
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int _value = 100;
  Widget _UpperWidget() {
    return Container(
      width: double.infinity,
      height: 240,
      decoration: BoxDecoration(
          color: widget.data.bgcolor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 4.0),
              blurRadius: 6.0,
              color: Colors.black54,
            ),
          ]),
      child: Stack(
        children: [
          Positioned(
            top: 10.0,
            right: 150.0,
            child: Opacity(
              opacity: 0.3,
              child: Hero(
                tag: widget.data.imageUrl,
                child: Image(
                  image: AssetImage(
                    widget.data.imageUrl,
                  ),
                  width: 200.0,
                  height: 180.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  widget.data.icon,
                  color: Colors.white,
                  size: 25.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.data.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
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
                      '${widget.data.price}',
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Buy gift cards',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              _UpperWidget(), //Upper Card
              SizedBox(height: 20.0),
              Container(
                height: 250.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Select option',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Size',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: [
                              SizedBox(
                                width: 56.0,
                                height: 50.0,
                                child: OutlineButton.icon(
                                  icon: Icon(
                                    Icons.remove,
                                    size: 20.0,
                                  ),
                                  label: SizedBox.shrink(),
                                  onPressed: () {
                                    setState(() {
                                      _value -= 10;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Text(
                                '\$ $_value',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                ),
                              ),
                              SizedBox(width: 20.0),
                              SizedBox(
                                width: 56.0,
                                height: 50.0,
                                child: OutlineButton.icon(
                                  icon: Icon(
                                    Icons.add,
                                    size: 20.0,
                                  ),
                                  label: SizedBox.shrink(),
                                  onPressed: () {
                                    setState(() {
                                      _value += 10;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50.0),
                          Text(
                            'Select store',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlagList(
                                  icon: FontAwesomeIcons.flag,
                                  message: 'UK Pressed'),
                              SizedBox(width: 25.0),
                              FlagList(
                                  icon: FontAwesomeIcons.flagCheckered,
                                  message: 'Russia Pressed'),
                              SizedBox(width: 25.0),
                              FlagList(
                                  icon: FontAwesomeIcons.flagUsa,
                                  message: 'USA Pressed'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select size',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '\$ $_value',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25.0,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              RaisedButton(
                hoverElevation: 20.0,
                onPressed: () => print('Check out'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: widget.data.bgcolor,
                textColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FlagList extends StatelessWidget {
  final IconData icon;
  final String message;

  const FlagList({
    Key key,
    this.icon,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.0,
      height: 50.0,
      child: OutlineButton.icon(
        icon: Icon(
          icon,
          size: 20.0,
        ),
        label: SizedBox.shrink(),
        onPressed: () => print(
          '$message',
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
