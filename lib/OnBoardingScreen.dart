import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yoga/size_config.dart';
import 'NamePicker.dart';

class OnBoardingScreen extends StatefulWidget {
  static String routeName = "/OnBoardingScreen";
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController(viewportFraction: 0.98);
  int currentPage = 0;
  bool canScroll = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView(
                  physics: canScroll
                      ? ScrollPhysics()
                      : NeverScrollableScrollPhysics(),
                  controller: controller,
                  onPageChanged: (value) {
                    setState(
                      () {
                        canScroll = false;
                        currentPage = value;
                        Timer(
                          Duration(seconds: 3),
                          () {
                            setState(
                              () {
                                canScroll = true;
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: 8,
                      ),
                      child: Column(
                        children: [
                          Spacer(
                            flex: 3,
                          ),
                          Text(
                            "PEARL",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(
                                32,
                              ),
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.5,
                            ),
                          ),
                          Text(
                            "welcome's you! Enjoy!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(
                                18,
                              ),
                              color: Colors.grey,
                            ),
                          ),
                          Image(
                            image: AssetImage(
                              'asset/ola.jpeg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Spacer(
                            flex: 3,
                          ),
                          Text(
                            "PEARL",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(32),
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.5,
                            ),
                          ),
                          Text(
                            "You can choose the \nduration of your session!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(
                                18,
                              ),
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(),
                          Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'asset/img2.jpeg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Spacer(
                            flex: 3,
                          ),
                          Text(
                            "PEARL",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(32),
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.5,
                            ),
                          ),
                          Text(
                            "Pick (or not) your ambient sound! \nAnd just start!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(
                                18,
                              ),
                              color: Colors.grey,
                            ),
                          ),
                          Image(
                            image: AssetImage(
                              'asset/este.jpeg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(
                                  0.2,
                                ),
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue[300].withOpacity(
                                      0.3,
                                    ),
                                    offset: Offset(
                                      0.0,
                                      15.0,
                                    ),
                                    blurRadius: 20.0,
                                    spreadRadius: 0.0,
                                  )
                                ],
                              ),
                              child: TextButton(
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                    color: Colors.blue[900],
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    new MaterialPageRoute(
                                      builder: (context) => new NamePicker(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 200,
      ),
      margin: EdgeInsets.only(
        right: 5,
      ),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue[800] : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.orange[900],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
      ),
    );
  }
}

class IntroContent extends StatelessWidget {
  const IntroContent({
    Key key,
    this.text,
    this.image,
  }) : super(
          key: key,
        );
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(flex: 3),
        Text(
          "PEARL",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(32),
            color: Colors.blue[700],
            fontWeight: FontWeight.bold,
            letterSpacing: 3.5,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.grey,
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
        ),
      ],
    );
  }
}
