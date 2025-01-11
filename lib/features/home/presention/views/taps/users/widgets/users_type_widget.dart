import 'package:flutter/material.dart';

class UserTypeWidget extends StatelessWidget {
  const UserTypeWidget({
    super.key,
    required this.userType,
    this.isActive = false,
    this.onTap,
  });

  final String userType;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: isActive ? Colors.blueAccent : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              width: 1,
              color: Colors.blueAccent,
            ),
          ),
        ),
        child: Text(
          userType,
          style: TextStyle(
            fontSize: 20,
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
