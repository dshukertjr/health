import 'package:flutter/material.dart';
import 'package:health/pages/health_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final secondaryAnimation = ModalRoute.of(context).secondaryAnimation;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 24,
              right: 24,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 80),
                Text(
                  'Hi, Mary',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text(
                    'How are you feeling today?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 100),
                SizedBox(
                  height: 0,
                  child: OverflowBox(
                    alignment: Alignment.topCenter,
                    maxHeight: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: AnimatedBuilder(
                          animation: secondaryAnimation,
                          child: Material(
                            shadowColor:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                            elevation: 10,
                            clipBehavior: Clip.hardEdge,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 12,
                                ),
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Search',
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              onSubmitted: (val) {},
                            ),
                          ),
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(secondaryAnimation.value, 0),
                              // opacity: animation.value,
                              child: child,
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Material(
              clipBehavior: Clip.hardEdge,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                splashColor: Theme.of(context).accentColor,
                onTap: () {
                  Navigator.push(
                    context,
                    HealthPageRoute(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 12,
                  ),
                  child: Text('Press'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
