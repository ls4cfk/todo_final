import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoDetailsButton extends StatelessWidget {
  TodoDetailsButton(
      {Key? key,
      required this.icon,
      required this.buttonText,
      this.isDone = false,
      this.callback})
      : super(key: key);

  final IconData icon;
  final String buttonText;
  final bool isDone;
  // ignore: prefer_typing_uninitialized_variables
  var callback;

  @override
  Widget build(BuildContext context) {
    MaterialStateProperty<Color> backgroundColor = MaterialStateProperty.all(
        isDone ? Colors.green : const Color.fromRGBO(255, 255, 255, 0.3));

    return SizedBox(
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            backgroundColor: backgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: 40,
            ),
            Text(buttonText)
          ],
        ),
        onPressed: callback,
      ),
      height: 80,
      width: 80,
    );
  }
}
