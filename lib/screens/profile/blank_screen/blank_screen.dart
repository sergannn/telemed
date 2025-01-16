import 'package:doctorq/screens/main_screen.dart';
import 'package:doctorq/widgets/boxshadow.dart';
import 'package:doctorq/widgets/spacing.dart';
import 'package:doctorq/app_export.dart';
import 'package:doctorq/widgets/custom_button.dart';
import 'package:doctorq/widgets/custom_icon_button.dart';
import 'package:doctorq/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../widgets/custom_drop_down.dart';


class ProfileBlankScreen extends StatefulWidget {
  const ProfileBlankScreen({Key? key}) : super(key: key);

  @override
  State<ProfileBlankScreen> createState() =>
      _ProfileBlankScreenState();
}

class _ProfileBlankScreenState extends State<ProfileBlankScreen> {
  List<String> dropdownItemList = ["Male", "Female"];
  Object dropDownVal = 'Male';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: size.width,
                    margin: getMargin(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonImageView(
                          imagePath: ImageConstant.appLogo,
                          height: getVerticalSize(36),
                          width: getHorizontalSize(36),
                        ),
                        HorizontalSpace(width: 20),
                        Text(
                          "Profile",
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
                Container(
                  width: double.infinity,
                  margin: getMargin(
                    left: 24,
                    top: 30,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: isDark
                        ? ColorConstant.darkContainer
                        : ColorConstant.whiteA700,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        20.00,
                      ),
                    ),
                    border: Border.all(
                      color:isDark?ColorConstant.darkLine: ColorConstant.bluegray50,
                      width: getHorizontalSize(
                        1.00,
                      ),
                    ),
                    boxShadow: isDark ? customDarkBoxShadow : customBoxShadow,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomIconButton(
                        isRtl: isRtl,
                        height: 60,
                        width: 60,
                        margin: getMargin(
                          top: 16,
                        ),
                        variant: IconButtonVariant.FillBlueA40019,
                        shape: IconButtonShape.RoundedBorder28,
                        padding: IconButtonPadding.PaddingAll20,
                        child: CommonImageView(
                          imagePath: ImageConstant.imgAutolayouthor,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 12,
                          bottom: 18,
                        ),
                        child: Text(
                          "Upload Photo Profile",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorConstant.bluegray300,
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
                  height: getVerticalSize(
                    1.00,
                  ),
                  margin: getMargin(
                    left: 24,
                    top: 24,
                    right: 24,
                  ),
                  child: CustomDivider(isDark: isDark),
                ),
                Padding(
                  padding: getPadding(left: 24, right: 24, top: 24),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Full Name",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color:isDark?Colors.white: ColorConstant.bluegray800A2,
                                fontSize: getFontSize(
                                  16,
                                ),
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.w600,
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
                            boxShadow:
                                isDark ? customDarkBoxShadow : customBoxShadow),
                        child: CustomTextFormField(
                          isDark: isDark,
                          width: size.width,
                          focusNode: FocusNode(),
                          hintText: "Full Name",
                          margin: getMargin(
                            top: 11,
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(left: 24, right: 24, top: 24),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Email",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color:isDark?Colors.white: ColorConstant.bluegray800A2,
                                fontSize: getFontSize(
                                  16,
                                ),
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.w600,
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
                            boxShadow:
                                isDark ? customDarkBoxShadow : customBoxShadow),
                        child: CustomTextFormField(
                          isDark: isDark,
                          width: size.width,
                          focusNode: FocusNode(),
                          hintText: "Email",
                          margin: getMargin(
                            top: 11,
                          ),
                          suffix: Padding(
                            padding: getPadding(left: 20, right: 20),
                            child: Image.asset(
                              ImageConstant.mailOutline,
                            ),
                          ),
                          suffixConstraints: BoxConstraints(
                              maxWidth: getHorizontalSize(64),
                              maxHeight: getVerticalSize(24)),
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(left: 24, right: 24, top: 24),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Gender",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color:isDark?Colors.white: ColorConstant.bluegray800A2,
                                fontSize: getFontSize(
                                  16,
                                ),
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.w600,
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
                      VerticalSpace(height: 10),
                      Container(
                        height: getVerticalSize(65),
                        decoration: BoxDecoration(
                            boxShadow:
                                isDark ? customDarkBoxShadow : customBoxShadow),
                        child: CustomDropDown(
                          isDark: isDark,
                          width: size.width,
                          focusNode: FocusNode(),
                          hintText: "Gender",
                          value: dropDownVal,
                          icon: Image.asset(
                            ImageConstant.dropDown,
                            height: getVerticalSize(
                              7.00,
                            ),
                            width: getHorizontalSize(
                              15.00,
                            ),
                          ),
                          items: dropdownItemList,
                          fontStyle: DropDownFontStyle.PlusJakartaSansMedium14,
                          onChanged: (value) {
                            setState(() {
                              dropDownVal = value;
                            });
                          },
                          alignment: Alignment.center,
                          prefixConstraints: BoxConstraints(
                            minWidth: getSize(
                              20.00,
                            ),
                            minHeight: getSize(
                              20.00,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 44,
                    right: 44,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Date of Birth",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color:isDark?Colors.white: ColorConstant.bluegray800A2,
                          fontSize: getFontSize(
                            16,
                          ),
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w600,
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
                GestureDetector(
                  onTap: ()async{
                   await _selectDate(context);
                  },
                  child: Container(
                    margin: getMargin(left: 24, right: 24, top: 10),
                    padding: getPadding(left: 20, right: 20,
                    top: 12,bottom: 12),
                    decoration: BoxDecoration(
                        boxShadow: isDark ? customDarkBoxShadow : customBoxShadow,
                        border: Border.all(
                          color:isDark?ColorConstant.darkLine: ColorConstant.bluegray50,
                        ),
                        color: isDark
                            ? ColorConstant.darkTextField
                            : ColorConstant.whiteA700,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    selectedDate==null?  Text('Date of birth',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        color: ColorConstant.hintColor,
                        fontSize: getFontSize(16),
                        fontWeight: FontWeight.w600,
                
                      ),
                      ):Text("${selectedDate!.toLocal()}".split(' ')[0],
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: getFontSize(16),
                        fontWeight: FontWeight.w600,
                
                      ),
                      ),
                   
                   
                    const Icon(Icons.calendar_today_rounded,
                    color: Color(0xff858C94),
                    )
                    
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: getMargin(
                    left: 24,
                    top: 24,
                    right: 24,
                  ),
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
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
                                  left: 23,
                                  right: 23,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Address",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color:isDark?Colors.white: ColorConstant.bluegray800A2,
                                        fontSize: getFontSize(
                                          16,
                                        ),
                                        fontFamily: 'Source Sans Pro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
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
                                  ],
                                ),
                              ),
                              Container(
                                 decoration: BoxDecoration(
                            boxShadow:
                                isDark ? customDarkBoxShadow : customBoxShadow),
                                child: CustomTextFormField(
                                  isDark: isDark,
                                  width: size.width,
                                  focusNode: FocusNode(),
                                  hintText: "Address",
                                  margin: getMargin(
                                    top: 11,
                                  ),
                                  textInputAction: TextInputAction.done,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  isDark: isDark,
                  width: size.width,
                  text: "Confirm",
                  margin: getMargin(
                    left: 24,
                    top: 18,
                    right: 24,
                    bottom: 20,
                  ),
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    Main()), (Route<dynamic> route) => false);
                  },
                  variant: ButtonVariant.FillBlueA400,
                  fontStyle: ButtonFontStyle.SourceSansProSemiBold18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  DateTime? selectedDate ;
   Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(1997,1,1),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
