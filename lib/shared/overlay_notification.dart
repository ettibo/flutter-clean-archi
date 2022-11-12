import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:overlay_support/overlay_support.dart';

import 'package:globo_fitness/ressources/theme/theme_colors.dart';
import 'package:globo_fitness/extensions/string_localized.dart';
import 'package:globo_fitness/translations/locale_keys.g.dart';

void showPopupNewConnectionStatus(
        {required bool isSuccess, bool shouldDismiss = true}) =>
    isSuccess
        ? (Timer.run(() => _showOverlay(
            LocaleKeys.toast_message_success_connexion_message.localized(),
            ThemeColors.skyBlue,
            CupertinoIcons.check_mark_circled_solid,
            ThemeColors.skyBlueOpacity,
            shouldDismiss)))
        : (Timer.run(() => _showOverlay(
            LocaleKeys.toast_message_error_connexion_message.localized(),
            ThemeColors.lightRed,
            Icons.error_outline,
            Colors.red,
            shouldDismiss)));

void _showOverlay(String message, Color color, IconData icon, Color iconColor,
    bool shouldDismiss) {
  showOverlayNotification((context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: color,
      child: SafeArea(
        child: ListTile(
          leading: SizedBox.fromSize(
              size: const Size(40, 40),
              child: ClipOval(
                  child: Icon(
                icon,
                color: iconColor,
              ))),
          title: Text(message),
        ),
      ),
    );
  }, duration: const Duration(milliseconds: 2000));
}
