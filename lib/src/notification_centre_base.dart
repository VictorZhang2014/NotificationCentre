import 'notification_name.dart';
import 'notification_observer.dart';


class NotificationCenter {
  
  final _observers = <NotificationObserver>[];

  static final NotificationCenter _instance = NotificationCenter.internal();

  factory NotificationCenter() => _instance;

  NotificationCenter.internal();


  /// Add the observer in your widget page so that it will be called if there is a posted notification.
  /// 
  /// For example:
  /// 
  ///   @override
  ///   void initState() { 
  ///       super.initState(); 
  /// 
  ///       NotificationCenter().addObserver(NOTIFICATION_NAME_USER_SIGNED_IN, this, () {
  ///           // Do something after the user has signed in.
  ///       });
  ///   }
  /// 
  /// and don't forget to remove the observer when the widget page is ready to close.
  ///   @override
  ///   void dispose() { 
  ///       NotificationCenter().removeObserver(NOTIFICATION_NAME_USER_SIGNED_IN, this);
  ///       super.dispose();
  ///   }
  void addObserver(NotificationName name, dynamic that, Function callback) {
    _observers.add(NotificationObserver(name: name, isa: that, func: callback)); 
  }
 

  /// Remove the observer in your widget page so that it will be released/disposed.
  /// 
  /// For example:
  /// 
  ///   @override
  ///   void dispose() { 
  ///       // This is generally called when the widget page is ready to close. 
  ///       // But you can specify the place you want for removing the observer.
  ///       NotificationCenter().removeObserver(NOTIFICATION_NAME_USER_SIGNED_OUT, this);
  ///       super.dispose();
  ///   }
  void removeObserver(NotificationName name, dynamic that, {Function? callback}) {
    _observers.removeWhere((elm) => elm.name == name && elm.isa == that);
  }
 

  /// Post a notification with parameters wherever you want
  /// 
  /// For example:
  ///  
  ///   void userPurchasedItem() { 
  ///       NotificationCenter().post(
  ///           NOTIFICATION_NAME_PURCHASE_COMPLETED, 
  ///           data: {"data": YOUR_DATA, "type": "completed"},
  ///       );
  ///   }
  void postNotification(NotificationName name, {dynamic data}) {
    for (var elm in _observers) {
      if (elm.name == name) {
        elm.func(data);
      }
    } 
  }

}

