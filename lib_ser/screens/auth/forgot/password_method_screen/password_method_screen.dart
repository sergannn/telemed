import 'package:doctorq/screens/auth/forgot/password_otp_active_screen/password_otp_active_screen.dart';
import 'package:doctorq/widgets/bkBtn.dart';
import 'package:doctorq/widgets/boxshadow.dart';
import 'package:doctorq/widgets/spacing.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import '../../../../widgets/custom_icon_button.dart';
import 'package:doctorq/app_export.dart';
import 'package:doctorq/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgotPasswordMethodScreen extends StatefulWidget {
  const ForgotPasswordMethodScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordMethodScreen> createState() => _ForgotPasswordMethodScreenState();
}

class _ForgotPasswordMethodScreenState extends State<ForgotPasswordMethodScreen> {
 
 bool smsSelected=true;
 
  @override

  Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
bool isRtl = context.locale==Constants.arLocal;
    return Scaffold(
       body:SafeArea(
          child:
           Column(
             mainAxisSize: MainAxisSize.max,
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 children: [
                   Container(
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
                   Container(
                     width: getHorizontalSize(
                       371.00,
                     ),
                     margin: getMargin(
                       left: 24,
                       top: 38,
                       right: 24,
                     ),
                     child: Text(
                       "Select which contact details should we use to reset your password",
                       maxLines: null,
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
                    GestureDetector(
                         onTap: (){
                        setState(() {
                          smsSelected=true;
                        });
                      },
                      child: Container(
                          margin: getMargin(
                            top: 12.0,
                            bottom: 12.0,
                            left: 20,
                            right: 20
                          ),
                          decoration: BoxDecoration(
                            color:isDark?ColorConstant.darkContainer: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(
                               getHorizontalSize(
                               20.00,
                               ),
                            ),
                            boxShadow: isDark?customDarkBoxShadow:customBoxShadow,
                          ),
                          child: OutlineGradientButton(
                            padding: EdgeInsets.only(
                               left: getHorizontalSize(
                               2.00,
                               ),
                               top: getVerticalSize(
                               2.00,
                               ),
                               right: getHorizontalSize(
                               2.00,
                               ),
                               bottom: getVerticalSize(
                               2.00,
                               ),
                            ),
                            strokeWidth: getHorizontalSize(
                               2.00,
                            ),
                            gradient: LinearGradient(
                               begin: const Alignment(
                               1,
                               1.0024292469024658,
                               ),
                               end: const Alignment(
                               0,
                               0.0024292469024658203,
                               ),
                               colors:!smsSelected?
                               isDark?[
                                ColorConstant.darkLine,
                                ColorConstant.darkLine,
                               ]:
                               [
                                ColorConstant.lightLine,
                                ColorConstant.lightLine,
                               ]: [
                               ColorConstant.blueA400,
                               ColorConstant.blue300,
                               ],
                            ),
                            corners: const Corners(
                               topLeft: Radius.circular(
                               20,
                               ),
                               topRight: Radius.circular(
                               20,
                               ),
                               bottomLeft: Radius.circular(
                               20,
                               ),
                               bottomRight: Radius.circular(
                               20,
                               ),
                            ),
                            child: Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisSize: MainAxisSize.max,
                               children: [
                               CustomIconButton(isRtl:isRtl,
                                 height: 80,
                                 width: 80,
                                 margin: getMargin(
                                       left: 24,
                                       top: 24,
                                       bottom: 24,
                                 ),
                                 variant: IconButtonVariant.FillBlueA40019,
                                 shape: IconButtonShape.CircleBorder40,
                                 padding: IconButtonPadding.PaddingAll24,
                                 child: CommonImageView(
                                       imagePath: ImageConstant.reviews,
                                 ),
                               ),
                               HorizontalSpace(width: 20),
                               Column(
                                     mainAxisSize: MainAxisSize.min,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text(
                       "via SMS:",
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         color: ColorConstant.gray600,
                         fontSize: getFontSize(
                           14,
                         ),
                         fontFamily: 'Source Sans Pro',
                         fontWeight: FontWeight.w400,
                       ),
                                       ),
                                       Padding(
                       padding: getPadding(
                         top: 16,
                       ),
                       child: Text(
                         "+6282******39",
                         overflow: TextOverflow.ellipsis,
                         textAlign: TextAlign.start,
                         style: TextStyle(
                           fontSize: getFontSize(
                             18,
                           ),
                           fontFamily: 'Source Sans Pro',
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                                       ),
                                     ],
                               ),
                               ],
                            ),
                          ),
                        ),
                    ),
                
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          smsSelected=false;
                        });
                      },
                      child: Container(
                          margin: getMargin(
                            top: 12.0,
                            bottom: 12.0,
                            left: 20,
                            right: 20
                          ),
                          decoration: BoxDecoration(
                            color:isDark?ColorConstant.darkContainer: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(
                               getHorizontalSize(
                               20.00,
                               ),
                            ),
                            boxShadow: isDark?customDarkBoxShadow:customBoxShadow,
                          ),
                          child: OutlineGradientButton(
                            padding: EdgeInsets.only(
                               left: getHorizontalSize(
                               2.00,
                               ),
                               top: getVerticalSize(
                               2.00,
                               ),
                               right: getHorizontalSize(
                               2.00,
                               ),
                               bottom: getVerticalSize(
                               2.00,
                               ),
                            ),
                            strokeWidth: getHorizontalSize(
                               2.00,
                            ),
                            gradient: LinearGradient(
                               begin: const Alignment(
                               1,
                               1.0024292469024658,
                               ),
                               end: const Alignment(
                               0,
                               0.0024292469024658203,
                               ),
                               colors:smsSelected? isDark?[
                                ColorConstant.darkLine,
                                ColorConstant.darkLine,
                               ]:
                               [
                                ColorConstant.lightLine,
                                ColorConstant.lightLine,
                               ]: [
                               ColorConstant.blueA400,
                               ColorConstant.blue300,
                               ],
                            ),
                            corners: const Corners(
                               topLeft: Radius.circular(
                               20,
                               ),
                               topRight: Radius.circular(
                               20,
                               ),
                               bottomLeft: Radius.circular(
                               20,
                               ),
                               bottomRight: Radius.circular(
                               20,
                               ),
                            ),
                            child: Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisSize: MainAxisSize.max,
                               children: [
                               CustomIconButton(isRtl:isRtl,
                                 height: 80,
                                 width: 80,
                                 margin: getMargin(
                                       left: 24,
                                       top: 24,
                                       bottom: 24,
                                 ),
                                 variant: IconButtonVariant.FillBlueA40019,
                                 shape: IconButtonShape.CircleBorder40,
                                 padding: IconButtonPadding.PaddingAll24,
                                 child: CommonImageView(
                                       imagePath: ImageConstant.mail,
                                 ),
                               ),
                               HorizontalSpace(width: 20),
                               Column(
                                     mainAxisSize: MainAxisSize.min,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text(
                       "via Email:",
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         color: ColorConstant.gray600,
                         fontSize: getFontSize(
                           14,
                         ),
                         fontFamily: 'Source Sans Pro',
                         fontWeight: FontWeight.w400,
                       ),
                                       ),
                                       Padding(
                       padding: getPadding(
                         top: 16,
                       ),
                       child: Text(
                         "ex***le@yourdomain.com",
                         overflow: TextOverflow.ellipsis,
                         textAlign: TextAlign.start,
                         style: TextStyle(
                           fontSize: getFontSize(
                             18,
                           ),
                           fontFamily: 'Source Sans Pro',
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                                       ),
                                     ],
                               ),
                               ],
                            ),
                          ),
                        ),
                    ),
                
                
                 ],
               ),
 
               CustomButton(isDark:isDark,
                  width: size.width,
                  text: "Continue",
                  margin: getMargin(
                    left: 24,
                  
                    right: 24,
                    bottom: 20,
                  ),
                  onTap: (){
                    Navigator.push(
    context,
    MaterialPageRoute(builder: (context)
 =>const ForgotPasswordOtpActiveScreen()),
  );
                  },
                  fontStyle: ButtonFontStyle.SourceSansProSemiBold18,
                ),
             
             ],
           ),
      ),
    );
  }
}
