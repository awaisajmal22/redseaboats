class NotificationModel{
  final String date;
  final List notification;
  NotificationModel({
    required this.date,
    required this.notification
  });
}
class Notification{
  final String title;
  final String subtitle;
  Notification({
    required this.subtitle,
    required this.title
  });
}