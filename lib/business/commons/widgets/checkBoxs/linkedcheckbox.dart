import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';

class LinkedCheckBox extends StatefulWidget {
  LinkedCheckBox(
      {required this.isChecked,
      required this.linkedText,
      required this.text,
      required this.linkedAction,
      Key? key})
      : super(key: key);

  bool isChecked;
  String linkedText;
  String text;
  Function linkedAction;

  @override
  State<LinkedCheckBox> createState() => _LinkedCheckBoxState();
}

class _LinkedCheckBoxState extends State<LinkedCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 26,
          width: 26,
          child: Checkbox(
            value: widget.isChecked,
            fillColor: MaterialStateProperty.all(
                widget.isChecked ? primaryColor : insideFormTextColor),
            checkColor: Colors.white,
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  widget.isChecked = true;
                } else {
                  widget.isChecked = false;
                }
              });
            },
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(children: [
              TextSpan(
                  text: widget.linkedText,
                  style: AppTheme.notoSansReg14Quaternary,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      widget.linkedAction.call();
                    }),
              TextSpan(
                text: widget.text,
                style: AppTheme.notoSansReg14Inside,
              ),
            ]),
          ),
        )
      ],
    );
  }
}
