import 'package:flutter/material.dart'; 
import 'package:notification_centre/notification_centre.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(    
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case LoginPage.routeName: return LoginPage(); 
              default: return MainPage();
            }
          }
        );
      }
    ); 
  }
}


class MainPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {

  String loginState = "Not Sign In";

  @override
  void initState() { 
    super.initState();
    NotificationCenter().addObserver(NOTIFICATION_NAME_USER_SIGNED_IN, this, () {
      // Update the UI once the user has signed in.
      setState(() {
        loginState = "You signed in!";
      });
    });
  }
  
  @override
  void dispose() {
    NotificationCenter().removeObserver(NOTIFICATION_NAME_USER_SIGNED_IN, this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(loginState),
      ),
    );
  }

}


class LoginPage extends StatelessWidget {

  static const routeName = "/login";

  String notificationName = "";

  LoginPage({super.key}) {
    // For the NotificationName, it is just a String value, it can be any strings. 
    // Just keep in mind, the `NotificationName` you defined/customed is equal to the observer and publisher.
    notificationName = NOTIFICATION_NAME_USER_SIGNED_IN;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            NotificationCenter().postNotification(
              notificationName, 
              data: {"userId": 123456789, "type": "normal"},
            );
          },
          child: Text("Go to Sign In"),
        ),
      ),
    );
  }

}