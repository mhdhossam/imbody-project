import 'package:flutter/material.dart';

class LayOutPageView extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  const LayOutPageView({
    super.key,
    required this.appBarTitle,
    required this.body ,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: theme.primaryColor,
          ),
          child: AppBar(
            title: Text(appBarTitle),
          ),
        ),
      ),
      body: body
    );
  }
}
