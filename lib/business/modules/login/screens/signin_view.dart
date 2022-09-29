import 'package:algoritmik_class/business/modules/createrequest/screens/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../../constants/localization.dart';
import '../../../../main.dart';
import '../../../commons/utils/validations.dart';
import '../../../commons/widgets/dialogs/loading_dialog.dart';
import '../../../commons/widgets/textformfields/general_text_form_field.dart';
import '../../../commons/widgets/textformfields/password_text_form_field.dart';
import '../../../models/login_result.dart';
import '../../createrequest/controller/createrequest_controller.dart';
import '../controller/signin_controller.dart';
import '../widgets/divider_widget.dart';
import '../widgets/snackbar.dart';

class SigninView extends StatelessWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    SigninController model = Provider.of<SigninController>(context);
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    if (kDebugMode && !isTest) {
      emailController.text = "admin@abc.com";
      passController.text = '\$admin@2022';
      // emailController.text = "bektasi@biscozum.com.tr";
      // passController.text = 'Pass123\$';

      //emailController.text = "baris.yildirim@biscozum.com";
      //passController.text = 'Abcd1234.';
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradientBackground),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 15.0, right: 16, bottom: 50),
            child: SafeArea(
              bottom: false,
              right: false,
              left: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Image(
                    height: 70,
                    width: 210,
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    Localization.of(context)!.signin_title,
                    style: AppTheme.notoSansMed16White,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: backgroundColor,
                        boxShadow: const [
                          BoxShadow(
                              color: containerShadowColor,
                              spreadRadius: 0,
                              blurRadius: 6,
                              offset: Offset(0, 3)),
                        ]),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 0, right: 16, left: 16),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 37,
                            ),
                            GeneralTextFormField(
                              emailController,
                              keyboardType: TextInputType.emailAddress,
                              placeholder: Localization.of(context)!
                                  .signin_email_placeholder,
                              validator: (value) =>
                                  Validations.validateEmail(value),
                              key: const Key('email-textfield'),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            PasswordTextFormField(
                              passController: passController,
                              placeHolder: Localization.of(context)!
                                  .signin_password_placeholder,
                              key: const Key('password-textfield'),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/newpassword'),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  Localization.of(context)!
                                      .signin_forgot_password,
                                  style: AppTheme.notoSansReg12Primary,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minHeight: 120, maxHeight: 240),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          bool valid = formKey.currentState
                                                  ?.validate() ??
                                              false;
                                          if (valid) {
                                            LoadingDialog.openDialog();

                                            context
                                                .read<SigninController>()
                                                .login(emailController.text,
                                                    passController.text)
                                                .then((result) {
                                              LoadingDialog.closeDialog();
                                              loginResult(
                                                  result,
                                                  emailController.text,
                                                  context);
                                            });
                                          }
                                        },
                                        key: const Key('login'),
                                        style: AppTheme.elevatedButtonStyle,
                                        child: Text(Localization.of(context)!
                                            .signin_login_button)),
                                  ),
                                  DividerWidget(Localization.of(context)!
                                      .signin_company_question),
                                  Flexible(
                                    flex: 1,
                                    child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            primary: loginGradientStartColor,
                                            side: const BorderSide(
                                              width: 1.0,
                                              color: loginGradientStartColor,
                                              style: BorderStyle.solid,
                                            )),
                                        onPressed: () {},
                                        child: Text(Localization.of(context)!
                                            .signin_company_button)),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginResult(LoginResult? result, String email, BuildContext context) {
    if (result != null) {
      switch (result) {
        case LoginResult.success:
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ChangeNotifierProvider(
                create: (context) => CreateRequestController(),
                child: const HomePage(),
              ),
            ),
          );
          break;
        case LoginResult.requiresTwoFactor:
          break;
        case LoginResult.invalidLogin:
          showSnackbar(context);
          break;
        default:
      }
    } else {
      showSnackbar(context);
    }
  }
}
