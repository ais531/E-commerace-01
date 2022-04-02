import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Icon(Icons.arrow_back_ios_rounded, color: kTextColor),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: kTextColor,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: kTextColor,
            )),
        SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}
