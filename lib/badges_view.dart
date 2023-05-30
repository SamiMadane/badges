import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:quickalert/quickalert.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';


class BadgesView extends StatefulWidget {
  const BadgesView({Key? key}) : super(key: key);

  @override
  State<BadgesView> createState() => _BadgesViewState();
}

class _BadgesViewState extends State<BadgesView> {
  int badgeCounter = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Badges Packege'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    badges.Badge(
                      badgeContent: Text(
                        '${badgeCounter.toString()}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: Icon(
                        Icons.notifications,
                        size: 48,
                      ),
                      showBadge: badgeCounter > 0 ? true : false,
                      badgeAnimation: badges.BadgeAnimation.slide(),
                      badgeStyle: badges.BadgeStyle(
                        shape: badges.BadgeShape.square,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton.icon(
                          icon: Icon(Icons.arrow_circle_up),
                          label: Text('Increase'),
                          onPressed: () {
                            setState(() {
                              badgeCounter++;
                            });
                          },
                        ),
                        OutlinedButton.icon(
                          icon: Icon(Icons.arrow_circle_down),
                          label: Text('Decrease'),
                          onPressed: () {
                            setState(() {
                              if (badgeCounter > 0) {
                                badgeCounter--;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Add Notification'),
                onPressed: () => addNotification(badgeCounter, context),

              )
            ],
          ),
        ),
      ),
    );
  }

  addNotification(int count, BuildContext context) async {
    await FlutterAppBadger.updateBadgeCount(count);
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Add $count Notification',
      text: 'Minimize the app to check it out!',
    );
  }
}
