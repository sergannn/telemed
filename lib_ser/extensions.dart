import 'dart:developer';

import 'package:doctorq/stores/appointments_store.dart';
import 'package:doctorq/stores/doctors_store.dart';
import 'package:doctorq/stores/user_store.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

extension BuildContextExt on BuildContext {

  static DoctorsStore storeDoctorsStore = getIt.get<DoctorsStore>();
  static AppointmentsStore storeAppointmentsStore = getIt.get<AppointmentsStore>();


  // All about user
  Map<dynamic, dynamic> get userData {
    UserStore storeUserStore = getIt.get<UserStore>();
    return storeUserStore.userData;
  }



  // All about doctors
  List get doctorsData {
    return storeDoctorsStore.doctorsDataList;
  }

  void setSelectedDoctorByIndex(int index) {
    storeDoctorsStore.setSelectedDoctor(storeDoctorsStore.doctorsDataList[index]);
  }

  Map<dynamic, dynamic> get selectedDoctor {
    return storeDoctorsStore.selectedDoctor;
  }

  // All about appointments
  List<Map<dynamic, dynamic>> get appointmentsData {
    return storeAppointmentsStore.appointmentsDataList;
  }

  void setSelectedAppointmentByIndex(int index) {
    storeAppointmentsStore.setSelectedAppointment(storeAppointmentsStore.appointmentsDataList[index]);
  }

  Map<dynamic, dynamic> get selectedAppointment {
    return storeAppointmentsStore.selectedAppointment;
  }

 

}
