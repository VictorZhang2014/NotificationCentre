# NotificationCenter

A lightweight publisher/observer open-source library used for messaging to run through the entire Flutter applications. Inspired by NotificationCenter in iOS and EventBus on in Android.


## Getting started

The `NotificationCentre` in Flutter is inspired by `NotificationCenter` in iOS and `EventBus` in Android, since it is used anywhere inside iOS (Swift/Objective-C) codebase, we are very familiar with the model of publisher&observer. Thinking of you, as an Android developer who has knowledge and is such familiar with `EventBus`.


## Features

- Observer: to observe events if there were messages being posted.
- Publisher: to publish the event to all observers.


## Usage

To add an observer, we suggest that you put the below code inside `initState()`, but you can still add the observer somewhere.
```dart
  @override
  void initState() { 
      super.initState(); 
      NotificationCenter().addObserver(NOTIFICATION_NAME_USER_SIGNED_IN, this, () {
          // Do something after the user has signed in.
      });
  }
```

To remove an observer, we suggest that you put the below code inside `dispose()`, but you can still remove the observer elsewhere.
```dart
  @override
  void dispose() { 
      NotificationCenter().removeObserver(NOTIFICATION_NAME_USER_SIGNED_IN, this);
      super.dispose();
  }
```

To post the message throughout the entire application, you can use the below code with ease.
```dart
  NotificationCenter().postNotification(
      NOTIFICATION_NAME_PURCHASE_COMPLETED, 
      data: {"data": YOUR_DATA, "type": "completed"},
  );
```
 
### Note

For the `NotificationName`, it is just an ordinary String value, it can be any strings. 
Just keep in mind, the `NotificationName` you defined is equal to when you call these three methods: `addObserver()`, `removeObserver()`, and `postNotification()`, pass through the `NotificationName` you set. 

