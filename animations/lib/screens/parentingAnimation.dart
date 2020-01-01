import 'package:flutter/material.dart';

class ParentingAnimation extends StatefulWidget {
  ParentingAnimation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ParentingAnimationState createState() => _ParentingAnimationState();
}

class _ParentingAnimationState extends State<ParentingAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation, childAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: -0.10, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    childAnimation = Tween(begin: 50.0, end: 200.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Delayed Animations'),
          ),
          body: Center(
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: Transform(
                    transform:
                        Matrix4.translationValues(animation.value, 0.0, 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Transform(
                            transform: Matrix4.translationValues(
                                animation.value * width, 0.0, 0.0),
                            child: Center(
                              child: AnimatedBuilder(
                                animation: childAnimation,
                                builder: (context, child) {
                                  return Center(
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      height: childAnimation.value * 2,
                                      width: childAnimation.value * 2,
                                      child: ListView(
                                        children: <Widget>[
                                          Text(
                                            'Login',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                                hintText: 'Username'),
                                          ),
                                          TextField(
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              hintText: 'Password',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          RaisedButton(
                                            child: Text('Login'),
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            onPressed: () {},
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Don\'t have on account?',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          OutlineButton(
                                            child: Text('Singup'),
                                            color: Colors.green,
                                            textColor: Colors.green,
                                            borderSide:
                                                BorderSide(color: Colors.green),
                                            onPressed: () {},
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
