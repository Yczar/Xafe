import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenViewModel extends ChangeNotifier {
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {

        });
  }
}
