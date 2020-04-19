import 'package:flutter/material.dart';

class HealthPageRoute extends PageRouteBuilder {
  HealthPageRoute()
      : super(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              HealthPage(),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            var begin = 0.0;
            var end = 1.0;
            var curve = Curves.easeIn;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: Offset(1.0, 0),
              ).animate(ModalRoute.of(context).secondaryAnimation),
              child: child,
            );
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
        );
}

class HealthPage extends StatelessWidget {
  const HealthPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation = ModalRoute.of(context).animation;
    final secondaryAnimation = ModalRoute.of(context).secondaryAnimation;
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Column(
        children: <Widget>[
          Spacer(),
          AnimatedBuilder(
            animation: animation,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: AnimatedBuilder(
                  animation: secondaryAnimation,
                  child: RaisedButton(
                    child: Text('tap'),
                    onPressed: () {
                      Navigator.of(context).push(ThirdPageRoute());
                    },
                  ),
                  builder: (context, child) {
                    return Align(
                      alignment: Alignment(secondaryAnimation.value, 0),
                      child: child,
                    );
                  }),
            ),
            builder: (context, child) {
              return SizedBox(
                height:
                    MediaQuery.of(context).size.height * 0.5 * animation.value,
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ThirdPageRoute extends PageRouteBuilder {
  ThirdPageRoute()
      : super(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              ThirdPage(),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            var begin = 0.0;
            var end = 1.0;
            var curve = Curves.easeIn;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: Offset(1.0, 0),
              ).animate(ModalRoute.of(context).secondaryAnimation),
              child: child,
            );
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
        );
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
