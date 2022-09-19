import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:globo_fitness/main_common.dart';
import 'package:globo_fitness/ressources/theme/theme_colors.dart';


void showSuccess(String message,
    {bool shouldDismiss = true}) {
  Timer.run(() => _showAlert(
      message,
      ThemeColors.skyBlue,
      CupertinoIcons.check_mark_circled_solid,
      ThemeColors.skyBlueOpacity,
      shouldDismiss));
}

void showError(String message,
    {bool shouldDismiss = true}) {
  Timer.run(() => _showAlert(message, ThemeColors.lightRed,
      Icons.error_outline, Colors.red, shouldDismiss));
}

void _showAlert(String message, Color color,
    IconData icon, Color iconColor, bool shouldDismiss) {
  showGeneralDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        if (shouldDismiss) {
          Future.delayed(const Duration(seconds: 4), () {
            Navigator.of(buildContext, rootNavigator: true).pop('true');
          });
        }

        return Material(
          type: MaterialType.transparency,
          child: WillPopScope(
            onWillPop: () async => false,
            child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10),
                            bottom: Radius.circular(10)),
                        color: color),
                    width: MediaQuery.of(buildContext).size.width - 40,
                    height: MediaQuery.of(buildContext).size.height / 9,
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          icon,
                          size: 30,
                          color: iconColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            message,
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, -0.35);
      const end = Offset.zero;
      const curve = Curves.decelerate;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },);
}
