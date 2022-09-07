import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Widget getPlatformTextField(
        {required BuildContext context,
        TextEditingController? controller,
        Function(String)? onChanged,
        void Function(String)? onSubmitted,
        String? hintText,
        FocusNode? focusNode,
        TextInputType keyboardType =
            const TextInputType.numberWithOptions(signed: true),
        double paddingAll = 25}) =>
    Padding(
      padding: EdgeInsets.all(paddingAll),
      child: PlatformTextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        focusNode: focusNode,
        keyboardType: keyboardType,
        cursorColor: Theme.of(context).primaryColor,
        hintText: hintText,
        style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        cupertino: (context, platform) => CupertinoTextFieldData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Theme.of(context).secondaryHeaderColor, width: 0.5),
          ),
        ),
      ),
    );
