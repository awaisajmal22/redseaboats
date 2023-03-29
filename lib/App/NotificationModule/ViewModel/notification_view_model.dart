import 'package:get/get.dart';

import '../Model/notification_model.dart';

class NotificationViewModel extends GetxController{
  List<NotificationModel> notificationList = <NotificationModel>[
    NotificationModel(
      date: "Today", 
      notification: <Notification>[
        Notification(subtitle: 'Your booking #1684635 has been successed!', title: 'System'),
        Notification(subtitle: 'Your booking #1684635 has been successed!', title: 'System'),
      ]
      ),
      NotificationModel(
      date: "Yesterday", 
      notification: <Notification>[
        Notification(subtitle: 'Your booking #1684635 has been successed!', title: 'System'),
        Notification(subtitle: 'Your booking #1684635 has been successed!', title: 'System'),
      ]
      ),

  ];
}