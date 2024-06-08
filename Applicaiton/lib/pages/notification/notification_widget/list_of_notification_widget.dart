import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notification_widget.dart';

class ListViewNotification extends StatelessWidget {
  final List notifications;
  final IconData icon;
  const ListViewNotification({
    super.key,
    required this.notifications,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: notifications.length,
      itemBuilder: (context, index) => NotificationWidget(
        title: 'Notification',
        content: notifications[index],
        messageNo: index,
        icon: icon,
      ),
    );
  }
}
