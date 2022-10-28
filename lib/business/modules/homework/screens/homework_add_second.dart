import 'package:algoritmik_class/business/modules/homework/controller/homework_controller.dart';
import 'package:algoritmik_class/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../commons/utils/validations.dart';
import '../../../commons/widgets/buttons/primary_button.dart';
import '../../../commons/widgets/duo_tone_font_awesome_icon.dart';
import '../../../commons/widgets/textformfields/general_text_form_field.dart';
import '../../../commons/widgets/textformfields/tap_text_form_field.dart';

class HomeWorkAddSecond extends StatelessWidget {
  HomeWorkAddSecond({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: pageHeight / 5, left: 16, right: 16),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ödev Detayı",
            style: AppTheme.notoSansReg24PrimaryText,
          ),
          Text(
              "Öğrencilerine göndermeden önce ödevin detaylarını belirtmelisin.",
              style: AppTheme.notoSansMed14White
                  .copyWith(color: primary2TextColor)),
          Consumer<HomeWorkController>(
              builder: (BuildContext context, controller, Widget? child) {
            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  GeneralTextFormField(
                    controller.homeworkTitle,
                    keyboardType: TextInputType.text,
                    placeholder: "Ödev Başlığı",
                    validator: (value) =>
                        Validations.validateIsNotEmpty(value, null),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GeneralTextFormField(
                    controller.homeworkDetails,
                    keyboardType: TextInputType.text,
                    placeholder: "Ödev Açıklaması",
                    validator: (value) =>
                        Validations.validateIsNotEmpty(value, null),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.displayTimePicker(
                          context, DateTime.now(), controller.homeworkDate);
                    },
                    child: TapTextFormField(
                      controller.homeworkDate,
                      placeholder: 'deneme',
                      keyboardType: TextInputType.phone,
                      icon: const Icon(Icons.date_range),
                      validator: (value) =>
                          Validations.validateIsNotEmpty(value, null),
                    ),
                  ),
                  controller.selectedId != -1
                      ? SizedBox(
                          width: pageWidht * 0.9,
                          child: PrimaryButton(
                            onPressed: () {
                              bool valid =
                                  formKey.currentState?.validate() ?? false;
                              if (valid) {
                                controller.createHomeWork();

                                controller.onNextPage(context);
                              }
                            },
                            text: "Devam",
                            textStyle: AppTheme.notoSansMed18White,
                            style: AppTheme.elevatedButtonStyle,
                          ),
                        )
                      : Container(),
                ],
              ),
            );
          }),
        ],
      )),
    );
  }
}
