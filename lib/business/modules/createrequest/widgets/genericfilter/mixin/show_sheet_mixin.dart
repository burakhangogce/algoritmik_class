import 'package:flutter/material.dart';

import '../../../../../../constants/app_color.dart';
import '../../../../../commons/widgets/title/text_icon_title.dart';

mixin ShowSheetMixin {
  static Future<T?> showCustomSheet<T>(
      {required BuildContext context,
      required Widget child,
      required String showTitle}) {
    return showModalBottomSheet<T>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              color: secondaryTextColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0))),
          margin: const EdgeInsets.only(top: 35),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                TextIconTitle(
                  title: showTitle,
                  action: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 21,
                ),
                Expanded(child: child),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 2),
        SizedBox(width: 300, child: const Divider(thickness: 10)),
        const Spacer(),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close))
      ],
    );
  }
}
