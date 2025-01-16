import 'dart:convert';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctorq/app_export.dart';
import 'package:doctorq/extensions.dart';
import 'package:doctorq/utils/utility.dart';
import 'package:doctorq/widgets/bkBtn.dart';
import 'package:doctorq/widgets/custom_button.dart';
import 'package:doctorq/widgets/custom_switch.dart';
import 'package:doctorq/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../main.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/pub.dart';

class AppointmentManager {
  final String doctorId;
  DateTime date;
  String formattedDate = '';
  List<dynamic> availableTimes = [];
  int selectedTime = 0;
//  ContactMethods contactMethod = ContactMethods.message;

  AppointmentManager({required this.doctorId, required this.date});

  Future<void> fetchTimes() async {
    print("fetching times");
    // Format the date as yyyy-MM-dd
    formattedDate =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    formattedDate = '2024-11-11';
    // Simulating fetching data from an API
    String apiUrl =
        'https://onlinedoctor.su/doctor-session-time?adminAppointmentDoctorId=12&date=$formattedDate&timezone_offset_minutes=180';
    print(apiUrl);
    printLog(apiUrl);
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body)['data']['slots'];
        availableTimes = jsonResponse;
      } else {
        print(response.statusCode);
        print("no dates");
        availableTimes = ['No dates'];
        //  date = formattedDate;
      }
    } catch (e) {
      printLog('Error fetching times: $e');
      availableTimes = ['No dates'];
    }
    printLog(availableTimes);
  }
}

class ScheduleSettingsScreen extends StatefulWidget {
  late AppointmentManager appointmentManager;
  ScheduleSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleSettingsScreen> createState() =>
      _ProfileSettingsAppearanceScreenState();
}

class _ProfileSettingsAppearanceScreenState
    extends State<ScheduleSettingsScreen> {
  late Map<dynamic, dynamic> doctor;
  late List<dynamic> availableTimesList = ['...'];
  late String formattedDate = '...';
  bool switchVal2 = true;
  bool switchVal3 = true;
  int selectedTime = 0;
  TimeOfDay? d1;
  TimeOfDay? d2;
  TimeOfDay? d3;
  TimeOfDay? d4;
  TimeOfDay? d5;
  TimeOfDay? d6;
  TimeOfDay? d7;
  late AppointmentManager appointmentManager;

  void initState() {
    printLog('initing');
    super.initState();
    doctor = context.userData;
    print(doctor);
    appointmentManager = AppointmentManager(
      doctorId: doctor['doctor_id'],
      date: DateTime(1),
    );
    appointmentManager.fetchTimes();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
    super.initState();
  }

  Future<void> _loadData() async {
    await appointmentManager.fetchTimes();
    printLog('loading data...');
    setState(() {
      availableTimesList = appointmentManager.availableTimes;
      formattedDate = appointmentManager.formattedDate;
    });
  }

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    print(selectedDate);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: size.width,
              margin: getMargin(
                top: 36,
              ),
              child: Padding(
                padding: getPadding(
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BkBtn(),
                    HorizontalSpace(width: 20),
                    Text(
                      "Настройки расписания",
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
            Row(children: [
              Checkbox(
                  value: true,
                  onChanged: (val) {
                    print('a');
                  }),
              SizedBox(width: 8),
              Text('Пн'),
              TextButton(
                  onPressed: () async {
                    final TimeOfDay? _timePicked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: 0, minute: 0));
                    setState(
                      () {
                        d1 = _timePicked;
                      },
                    );
                  },
                  child: Text(d1 == null ? "start time" : d1.toString()))
            ]),
            Row(children: [
              Checkbox(
                  value: true,
                  onChanged: (val) {
                    print('a');
                  }),
              SizedBox(width: 8),
              Text('Вт'),
              SizedBox(width: 8),
              Column(children: [
                Row(children: [
                  Text('Начало:'),
                  TextButton(
                      onPressed: () async {
                        final TimeOfDay? _timePicked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 0, minute: 0));
                        setState(
                          () {
                            d2 = _timePicked;
                          },
                        );
                      },
                      child: Text(d2 == null ? "00:00" : d2.toString()))
                ]),
                Row(children: [
                  Text('Конец:'),
                  TextButton(
                      onPressed: () async {
                        final TimeOfDay? _timePicked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 0, minute: 0));
                        setState(
                          () {
                            d2 = _timePicked;
                          },
                        );
                      },
                      child: Text(d2 == null ? "00:00" : d2.toString()))
                ]),
              ])
            ]),
            Row(children: [
              Checkbox(
                  value: true,
                  onChanged: (val) {
                    print('a');
                  }),
              SizedBox(width: 8),
              Text('Ср'),
              TextButton(
                  onPressed: () async {
                    final TimeOfDay? _timePicked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: 0, minute: 0));
                    setState(
                      () {
                        d3 = _timePicked;
                      },
                    );
                  },
                  child: Text(d3 == null ? "00:00" : d3.toString()))
            ]),
            Row(children: [
              Checkbox(
                  value: true,
                  onChanged: (val) {
                    print('a');
                  }),
              SizedBox(width: 8),
              Text('Чт'),
              TextButton(
                  onPressed: () async {
                    final TimeOfDay? _timePicked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: 0, minute: 0));
                    setState(
                      () {
                        d4 = _timePicked;
                      },
                    );
                  },
                  child: Text(d4 == null ? "00:00" : d4.toString()))
            ]),
            Row(children: [
              Checkbox(
                  value: true,
                  onChanged: (val) {
                    print('a');
                  }),
              SizedBox(width: 8),
              Text('Пт'),
              TextButton(
                  onPressed: () async {
                    final TimeOfDay? _timePicked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: 0, minute: 0));
                    setState(
                      () {
                        d5 = _timePicked;
                      },
                    );
                  },
                  child: Text(d5 == null ? "00:00" : d5.toString()))
            ]),
            Row(children: [
              Checkbox(
                  value: true,
                  onChanged: (val) {
                    print('a');
                  }),
              SizedBox(width: 8),
              Text('Сб'),
              TextButton(
                  onPressed: () async {
                    final TimeOfDay? _timePicked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: 0, minute: 0));
                    setState(
                      () {
                        d6 = _timePicked;
                      },
                    );
                  },
                  child: Text(d6 == null ? "00:00" : d6.toString()))
            ]),
            Row(children: [
              Checkbox(
                  value: true,
                  onChanged: (val) {
                    print('a');
                  }),
              SizedBox(width: 8),
              Text('Вс'),
              TextButton(
                  onPressed: () async {
                    final TimeOfDay? _timePicked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: 0, minute: 0));
                    setState(
                      () {
                        d7 = _timePicked;
                      },
                    );
                  },
                  child: Text(d7 == null ? "00:00" : d7.toString()))
            ]),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: getPadding(
                    top: 31,
                  ),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /*
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 8,
                                  bottom: 7,
                                ),
                                child: Text(
                                  "Темный режим",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: getFontSize(
                                      16,
                                    ),
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              CustomSwitch(
                                value: themeManager.themeMode == ThemeMode.dark,
                                onChanged: (value) {
                                  setState(() {});
                                  themeManager.toggleTheme(value);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),*/

                        Align(
                          //                  padding: getPadding(right: 20, left: 20),
                          child: SingleChildScrollView(
                              child: DatePicker(
                            DateTime.now(),
                            initialSelectedDate: DateTime.now(),
                            selectionColor: ColorConstant.blueA400,
                            height: MediaQuery.of(context).size.height * 0.15,
                            dateTextStyle: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                color: ColorConstant.blueA400,
                                fontWeight: FontWeight.w600,
                                fontSize: 23),
                            dayTextStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Source Sans Pro',
                                color: ColorConstant.blueA400),
                            monthTextStyle: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              color: ColorConstant.blueA400,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            selectedTextColor: Colors.white,
                            onDateChange: (date) {
                              // New date selected
                              setState(() {
                                selectedDate = date;
                              });
                            },
                          )),
                        ),
                        SizedBox(height: 20),
                        SizedBox(height: 20),
                        Text('Gap duration'),
                        SizedBox(height: 10),
                        SizedBox(
                          height: getVerticalSize(240),
                          child: GridView.builder(
                            padding: getPadding(
                              left: 20,
                              top: 10,
                              right: 20,
                            ),
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              childAspectRatio: 2.767,
                              // mainAxisExtent: getVerticalSize(
                              //   158.00,
                              // ),
                              maxCrossAxisExtent: 200,
                              mainAxisSpacing: getHorizontalSize(
                                10.00,
                              ),
                              crossAxisSpacing: getHorizontalSize(
                                10.00,
                              ),
                            ),
                            itemCount: availableTimesList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedTime = index;
                                    print(availableTimesList[selectedTime]);
                                  });
                                },
                                child: Container(
                                  padding: getPadding(
                                    left: 20,
                                    top: 8,
                                    right: 20,
                                    bottom: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedTime == index
                                        ? ColorConstant.blueA400
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        21.50,
                                      ),
                                    ),
                                    border: Border.all(
                                      color: ColorConstant.blueA400,
                                      width: getHorizontalSize(
                                        2.00,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    //'12:00 - 13:00',

                                    availableTimesList[index]
                                        .split('-')
                                        .map((e) => e + '\n')
                                        .join(),

                                    // availableTimesList[index] +
                                    //     '${isMorning ? ' AM' : ' PM'}',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: selectedTime == index
                                          ? Colors.white
                                          : ColorConstant.blueA400,
                                      fontSize: getFontSize(
                                        17,
                                      ),
                                      fontFamily: 'Source Sans Pro',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        CustomButton(
                          isDark: isDark,
                          width: size.width,
                          text: "Сохранить",
                          margin: getMargin(
                            left: 24,
                            top: 25,
                            right: 24,
                            bottom: 20,
                          ),
                          onTap: () {
                            print(selectedDate);
                            // print()
                            /*   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => 
                          AppointmentsStep2FilledScreen(
                              date: selectedDate)),
                    );*/
                          },
                          fontStyle: ButtonFontStyle.SourceSansProSemiBold18,
                        ),
                        Container(
                          height: getVerticalSize(
                            1.00,
                          ),
                          margin: getMargin(
                            left: 24,
                            top: 10,
                            bottom: 10,
                            right: 24,
                          ),
                          child: CustomDivider(isDark: isDark),
                        ),
                        /*  InkWell(
                        onTap: () {
                          setState(() {
                            switchVal2 = !switchVal2;
                          });
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 24,
                              top: 10,
                              bottom: 10,
                              right: 24,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                 Padding(
                                  padding: getPadding(
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    "Doctor?",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: getFontSize(
                                        16,
                                      ),
                                      fontFamily: 'Source Sans Pro',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                CustomSwitch(
                                  value: switchVal2,
                                  onChanged: (value) async {
                                    await changeRole(value);
                                    setState(() {
                                      switchVal2 = !switchVal2;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),*/
                        Container(
                          height: getVerticalSize(
                            1.00,
                          ),
                          margin: getMargin(
                            left: 24,
                            top: 10,
                            bottom: 10,
                            right: 24,
                          ),
                          child: CustomDivider(isDark: isDark),
                        ),
                        /*InkWell(
                        onTap: () {
                          setState(() {
                            switchVal3 = !switchVal3;
                          });
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 24,
                              top: 10,
                              bottom: 10,
                              right: 24,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 8,
                                    bottom: 7,
                                  ),
                                  child: Text(
                                    "Full Screen Mode",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: getFontSize(
                                        16,
                                      ),
                                      fontFamily: 'Source Sans Pro',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                CustomSwitch(
                                  value: switchVal3,
                                  onChanged: (value) {
                                    setState(() {
                                      switchVal3 = !switchVal3;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),*/
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
