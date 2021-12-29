import 'package:flutter/material.dart';
import 'package:flutter_ui_challenge_01_02/Constants/constants.dart';

class customNavBar extends StatefulWidget {
  const customNavBar({Key? key}) : super(key: key);

  @override
  _customNavBarState createState() => _customNavBarState();
}

class _customNavBarState extends State<customNavBar> {
  int selectedIndex = 0;

  List<IconData> data = [
    Icons.home_outlined,
    Icons.person_outline,
    Icons.gamepad_outlined,
    Icons.settings_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(50),
        color: changeTheme().cambiarTemplate("navbar"),
        child: Container(
          height: 70,
          width: double.infinity,
          child: ListView.builder(
            itemCount: data.length,
            padding: const EdgeInsets.symmetric(horizontal: 45),
            itemBuilder: (ctx, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                    if (i % 2 == 0) {
                      changeTheme.theme = true;
                    } else {
                      changeTheme.theme = false;
                    }
                  });
                },
                child: Icon(
                  data[i],
                  size: 32,
                  color: i == selectedIndex
                      ? kPinkBackgroud
                      : Colors.grey.shade300,
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
