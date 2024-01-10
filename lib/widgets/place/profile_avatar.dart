import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Flexible(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar1.png'),
          ),
        )
      ],
    );
  }
}