import 'package:flutter/material.dart';

class HealthPageRoute extends PageRouteBuilder {
  HealthPageRoute()
      : super(
          transitionDuration: Duration(seconds: 5),
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              HealthPage(animation: animation),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            var begin = 0.0;
            var end = 1.0;
            var curve = Curves.easeIn;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
        );
}

class HealthPage extends StatelessWidget {
  final Animation<double> animation;

  const HealthPage({Key key, @required this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  )),
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
