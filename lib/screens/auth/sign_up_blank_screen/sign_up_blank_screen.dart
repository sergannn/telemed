import 'package:doctorq/app_export.dart';
import 'package:doctorq/screens/profile/blank_screen/blank_screen.dart';
import 'package:doctorq/screens/auth/sign_in_blank_screen/doctor_screen.dart';
import 'package:doctorq/screens/auth/sign_in_blank_screen/sign_in_blank_screen.dart';
import 'package:doctorq/widgets/boxshadow.dart';
import 'package:doctorq/widgets/custom_button.dart';
import 'package:doctorq/widgets/custom_checkbox.dart';
import 'package:doctorq/widgets/custom_text_form_field.dart';
import 'package:doctorq/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:doctorq/services/auth_service.dart';

class SignUpBlankScreen extends StatefulWidget {
  const SignUpBlankScreen({Key? key}) : super(key: key);

  @override
  State<SignUpBlankScreen> createState() => _SignUpBlankScreenState();
}

class _SignUpBlankScreenState extends State<SignUpBlankScreen> {
  bool checkbox = false;
  bool obscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isRtl = context.locale == Constants.arLocal;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: getPadding(left: 24, right: 24, top: 24),
                  child: SizedBox(
                    height: getVerticalSize(190),
                    width: getHorizontalSize(200),
                    child: Stack(
                      children: [
                        Image.asset(
                          ImageConstant.logoDecoration,
                          height: getVerticalSize(190),
                          width: getHorizontalSize(200),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageConstant.appLogo,
                                height: getVerticalSize(80),
                                width: getHorizontalSize(80),
                              ),
                              Text(
                                "DoctorQ",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConstant.blueA400,
                                  fontSize: getFontSize(
                                    25,
                                  ),
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      left: 24,
                      top: 50,
                      right: 24,
                    ),
                    child: Text(
                      "Регистрация",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: getFontSize(
                          23,
                        ),
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    margin: getMargin(
                      left: 24,
                      top: 30,
                      right: 24,
                    ),
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  2.00,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    left: 24,
                                    right: 24,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: getPadding(),
                                        child: Text(
                                          "Email",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: isDark
                                                ? Colors.white
                                                : ColorConstant.bluegray800A2,
                                            fontSize: getFontSize(
                                              16,
                                            ),
                                            fontFamily: 'Source Sans Pro',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          bottom: 5,
                                        ),
                                        child: Text(
                                          "*",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: ColorConstant.redA700A2,
                                            fontSize: getFontSize(
                                              14,
                                            ),
                                            fontFamily: 'Source Sans Pro',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: isDark
                                          ? customDarkBoxShadow
                                          : customBoxShadow),
                                  child: CustomTextFormField(
                                    controller: emailController,
                                    isDark: isDark,
                                    width: size.width,
                                    focusNode: FocusNode(),
                                    hintText: "Email",
                                    margin: getMargin(
                                      top: 11,
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    margin: getMargin(
                      left: 24,
                      top: 20,
                      right: 24,
                    ),
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                2.00,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: getPadding(
                                  left: 24,
                                  top: 1,
                                  right: 24,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Text(
                                        "Password",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: isDark
                                              ? Colors.white
                                              : ColorConstant.bluegray800A2,
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          fontFamily: 'Source Sans Pro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        bottom: 5,
                                      ),
                                      child: Text(
                                        "*",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.redA700A2,
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          fontFamily: 'Source Sans Pro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    boxShadow: isDark
                                        ? customDarkBoxShadow
                                        : customBoxShadow),
                                child: CustomTextFormField(
                                  controller: passwordController,
                                  isDark: isDark,
                                  width: size.width,
                                  focusNode: FocusNode(),
                                  hintText: "Password",
                                  margin: getMargin(
                                    top: 11,
                                  ),
                                  textInputAction: TextInputAction.done,
                                  alignment: Alignment.center,
                                  suffix: Container(
                                    margin: getMargin(
                                      left: 24,
                                      right: 24,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          obscure = !obscure;
                                        });
                                      },
                                      child: CommonImageView(
                                        imagePath: obscure
                                            ? ImageConstant.visibilityOff
                                            : ImageConstant.visibilityOn,
                                      ),
                                    ),
                                  ),
                                  suffixConstraints: BoxConstraints(
                                    maxWidth: getHorizontalSize(
                                      74.00,
                                    ),
                                    maxHeight: getVerticalSize(
                                      24.00,
                                    ),
                                  ),
                                  isObscureText: obscure,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20), // Add space between fields

                ToggleButtons(
                  constraints: const BoxConstraints(
                    minHeight: 32.0,
                    minWidth: 100.0,
                  ),
                  children: [Text('Доктор'), Text('Пациент')],
                  isSelected: [
                    _selectedRole == 'doctor',
                    _selectedRole == 'patient'
                  ],

                  // This callback return the index of the c
                  onPressed: (int index) {
                    setState(() {
                      _selectedRole = index == 0 ? 'doctor' : 'patient';
                    });
                  },
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomCheckbox(
                    alignment: Alignment.centerLeft,
                    text: "Remember me",
                    iconSize: 16,
                    value: checkbox,
                    padding: getPadding(
                      left: 48,
                      top: 22,
                      right: 48,
                    ),
                    onChange: (value) {
                      checkbox = value;
                      setState(() {});
                    },
                  ),
                ),
                CustomButton(
                  isDark: isDark,
                  width: size.width,
                  text: "Отправить",
                  margin: getMargin(
                    left: 24,
                    top: 22,
                    right: 24,
                  ),
                  onTap: () async {
                    var authRes = await regUser(context, emailController.text,
                        passwordController.text, _selectedRole!);
                    if (authRes == true) {
                      print("ok");

                      showDialog(
                        barrierColor: Colors.black.withOpacity(0.5),
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          Future.delayed(const Duration(milliseconds: 600), () {
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileBlankScreen()),
                                (Route<dynamic> route) => false);
                          });
                          return Dialog(
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              elevation: 0.0,
                              child: Center(
                                child: Container(
                                  width: getHorizontalSize(124),
                                  height: getVerticalSize(124),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: isDark
                                          ? ColorConstant.darkBg
                                          : ColorConstant.whiteA700),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: ColorConstant.blueA400,
                                    backgroundColor:
                                        ColorConstant.blueA400.withOpacity(.3),
                                  )),
                                ),
                              ));
                        },
                      );
                    }
                  },
                  variant: ButtonVariant.FillBlueA400,
                  fontStyle: ButtonFontStyle.SourceSansProSemiBold18,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      left: 24,
                      top: 24,
                      right: 24,
                    ),
                    child: Text(
                      "or continue with",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: getFontSize(
                          16,
                        ),
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      left: 24,
                      top: 27,
                      right: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: CustomButton(
                            isDark: isDark,
                            width: 178,
                            text: "Facebook",
                            variant: ButtonVariant.OutlineGray100,
                            shape: ButtonShape.RoundedBorder12,
                            fontStyle: ButtonFontStyle.SourceSansProSemiBold16,
                            prefixWidget: Container(
                              padding: getPadding(
                                left: 8,
                                top: 3,
                                right: 8,
                                bottom: 3,
                              ),
                              margin: getMargin(
                                  right: isRtl ? 0 : 12, left: isRtl ? 12 : 0),
                              decoration: BoxDecoration(
                                color: ColorConstant.indigo600,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    12.50,
                                  ),
                                ),
                              ),
                              child: CommonImageView(
                                svgPath: ImageConstant.imgFacebook,
                              ),
                            ),
                          ),
                        ),
                        HorizontalSpace(width: 16),
                        Expanded(
                          child: CustomButton(
                            isDark: isDark,
                            width: 178,
                            text: "Google",
                            variant: ButtonVariant.OutlineGray100,
                            shape: ButtonShape.RoundedBorder12,
                            fontStyle: ButtonFontStyle.SourceSansProSemiBold16,
                            prefixWidget: Container(
                              margin: getMargin(
                                  right: isRtl ? 0 : 12, left: isRtl ? 12 : 0),
                              child: CommonImageView(
                                svgPath: ImageConstant.imgGoogle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      left: 24,
                      top: 37,
                      right: 24,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: getPadding(
                            bottom: 1,
                          ),
                          child: Text(
                            "Already have an account?",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorConstant.bluegray400,
                              fontSize: getFontSize(
                                16,
                              ),
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        HorizontalSpace(width: 8),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SignInBlankScreen()),
                            );
                          },
                          child: Text(
                            "Sign in",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorConstant.blueA400,
                              fontSize: getFontSize(
                                16,
                              ),
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
