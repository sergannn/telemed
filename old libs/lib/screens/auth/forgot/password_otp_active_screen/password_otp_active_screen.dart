import 'package:doctorq/app_export.dart';
import 'package:doctorq/screens/auth/reset/password_screen/password_screen.dart';
import 'package:doctorq/widgets/bkBtn.dart';
import 'package:doctorq/widgets/custom_button.dart';
import 'package:doctorq/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordOtpActiveScreen extends StatelessWidget {
  const ForgotPasswordOtpActiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
       body:SafeArea(
          child:
           SizedBox(
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: size.width,
                  margin: getMargin(
                    top: 36,
                    left: 20,
                    right: 20
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                     const BkBtn(),
                 
                    HorizontalSpace(width: 20),
                      Text(
                        "Forgot Password",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                         
                          fontSize: getFontSize(
                            26,
                          ),
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: getPadding(
                      left: 24,
                     
                      right: 24,
                    ),
                    child: Text(
                      "Code has been send to +6282******39",
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
                  Padding(
                    padding: getPadding(
                      left: 24,
                      top: 63,
                      right: 24,
                    ),
                    child: SizedBox(
                      width: size.width,
                      height: getVerticalSize(
                        90.00,
                      ),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        obscuringCharacter: '*',
                        keyboardType: TextInputType.number,
                        autoDismissKeyboard: true,
                        enableActiveFill: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {},
                        textStyle: TextStyle(
                        
                          fontSize: getFontSize(
                            29,
                          ),
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w600,
                        ),
                        pinTheme: PinTheme(
                          fieldHeight: getHorizontalSize(
                            68.00,
                          ),
                          fieldWidth: getHorizontalSize(
                            83.00,
                          ),
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              20.00,
                            ),
                          ),
                          selectedFillColor:isDark?ColorConstant.darkTextField: ColorConstant.whiteA700,
                          activeFillColor:isDark?ColorConstant.darkTextField: ColorConstant.whiteA700,
                          inactiveFillColor:isDark?ColorConstant.darkTextField: ColorConstant.whiteA700,
                          inactiveColor:isDark?ColorConstant.darkBottomSheet: ColorConstant.fromHex("#1212121D"),
                          selectedColor:ColorConstant.blueA400,
                          activeColor:isDark?ColorConstant.darkBottomSheet: ColorConstant.fromHex("#1212121D"),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: getMargin(
                      left: 24,
                      top: 64,
                      right: 24,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Resend code in ",
                            style: TextStyle(
                           color: isDark?Colors.white:Colors.black,
                              fontSize: getFontSize(
                                16,
                              ),
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "56",
                            style: TextStyle(
                              color: ColorConstant.blueA400,
                              fontSize: getFontSize(
                                16,
                              ),
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: " s",
                            style: TextStyle(
                                
                              fontSize: getFontSize(
                                16,
                              ),
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
             
             
              CustomButton(isDark:isDark,
                width: size.width,
                text: "Verify",
                margin: getMargin(
                  left: 24,
                 
                  right: 24,
                  bottom: 20,
                ),
                onTap: (){
                  showDialog(
            barrierColor: Colors.black.withOpacity(0.5),
              barrierDismissible: true,

              context: context,
              builder: (context) {
                Future.delayed(const Duration(milliseconds: 600), () {
                          Navigator.of(context).pop(true);
                          Navigator.push(
    context,
    MaterialPageRoute(builder: (context)
 =>const ResetPasswordScreen()),
  );
                        });
                return Dialog(
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  elevation: 0.0,
                 
                  child:Center(
                    child: Container(
                      
                      width: getHorizontalSize(124),
                      height: getVerticalSize(124),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isDark?ColorConstant.darkBg:ColorConstant.whiteA700
                      ),
                      child: Center(
                        child: CircularProgressIndicator(color: ColorConstant.blueA400,
                        backgroundColor:ColorConstant.blueA400.withOpacity(.3) ,
                        )
                       
                      ),
                    ),
                  )
                             
                );
              },
            );
                 
                },
                fontStyle: ButtonFontStyle.SourceSansProSemiBold18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
