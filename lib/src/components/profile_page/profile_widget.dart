import 'package:flutter/material.dart';
import 'package:tsumitabe_frontend/src/models/user.dart';

class ProfileWidget extends StatefulWidget {
  final User user;

  const ProfileWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfileWidgetState();
}

class ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.user.email));
  }
}
