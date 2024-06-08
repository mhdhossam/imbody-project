import 'package:flutter/material.dart';

import 'notification_widget/list_of_notification_widget.dart';

class NotificationView extends StatelessWidget {
  static const String routeName = '/notifications';

  static final List<String> notifications = [
    'Notification 1',
    'Notification 2',
    'Notification 3',
    'Notification 5',
  ];
  static final List<String> messages = [
    'Message 1',
  ];
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListViewNotification(
      notifications: notifications,
      icon: Icons.notifications_rounded,
    );
  }
}
