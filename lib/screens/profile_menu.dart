import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.all(10),
          side: BorderSide(width: 1.0, color: Colors.white),
          backgroundColor: Color(0xff005381),
        ),
        onPressed: press,
        child: Row(
          children: [
            Expanded(child: Text(text, style: TextStyle(
                color: Colors.white,
                fontSize: 12
            ),)),
            Icon(Icons.arrow_forward_ios, size: 12,),
          ],
        ),
      ),
    );
  }
}
