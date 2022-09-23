import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:globo_fitness/ressources/theme/theme_colors.dart';
import 'package:globo_fitness/shared/global_key.dart';
import 'package:globo_fitness/extensions/nullable_check.dart';
import 'package:globo_fitness/extensions/string_localized.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';

void showPopupNewConnectionStatus(bool isSuccess,
        {bool shouldDismiss = true}) =>
    isSuccess
        ? (Timer.run(() => _showAlert(
            LocaleKeys.toast_message_success_connexion_message.localized(),
            ThemeColors.skyBlue,
            CupertinoIcons.check_mark_circled_solid,
            ThemeColors.skyBlueOpacity,
            shouldDismiss)))
        : (Timer.run(() => _showAlert(
            LocaleKeys.toast_message_error_connexion_message.localized(),
            ThemeColors.lightRed,
            Icons.error_outline,
            Colors.red,
            shouldDismiss)));

void _showAlert(String message, Color color, IconData icon, Color iconColor,
    bool shouldDismiss) {
  GlobalContextKey.instance.globalKey.currentContext.let((that) {
    showGeneralDialog(
      context: GlobalContextKey.instance.globalKey.currentContext!,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        if (shouldDismiss) {
          Future.delayed(const Duration(seconds: 2), () {
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

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  });
}
