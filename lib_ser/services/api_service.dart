import 'dart:convert';
import 'dart:developer';

import 'package:doctorq/constant/constants.dart';
import 'package:doctorq/models/appointment_model.dart';
import 'package:doctorq/models/doctor_model.dart';
import 'package:doctorq/screens/appointments/steps/step_2_filled_screen/step_2_filled_screen.dart';
import 'package:doctorq/stores/appointments_store.dart';
import 'package:doctorq/stores/doctors_store.dart';
import 'package:doctorq/utils/utility.dart';

import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

GetIt getIt = GetIt.instance;

Future<bool> getDoctors() async {
  printLog('Getting doctors');
  print("getdoctors");
  String getDoctors = '''
    query doctors {
      doctors(first: 108) {
        data {
            doctor_id: id
            specializations {
                name
            }
            doctorUser {
                user_id: id 
                username: full_name
                first_name
                last_name
                photo: profile_image
            }
        }
        paginatorInfo {
          total
          currentPage
          hasMorePages
        }
      }
    }
  ''';

  final QueryOptions options = QueryOptions(
    document: gql(getDoctors),
  );
  GraphQLClient graphqlClient = await graphqlAPI.noauthClient();
  debugPrintTransactionStart('query doctors');
  final QueryResult result = await graphqlClient.query(options);
  debugPrintTransactionEnd('query doctors');

  if (result.hasException) {
    printLog(result.exception.toString(), name: 'query doctors');
    // snackBar(context, message: result.exception.toString());
    return false;
  }

  final json = result.data!["doctors"]["data"];

  DoctorsStore storeDoctorsStore = getIt.get<DoctorsStore>();

  storeDoctorsStore.clearDoctorsData();

  json.forEach((doctor) {
    DoctorModel doctorModel = DoctorModel.fromJson(doctor);
    storeDoctorsStore.addDoctorToDoctorsData(doctorModel.toJson());
  });

  return true;
}

Future<bool> setAppointment(
    {required String doctor_id,
    required String date,
    required String patient_id,
    required String status,
    required String from_time,
    required String from_time_type,
    required String to_time,
    required String to_time_type,
    required String description,
    required String service_id,
    required String payment_type,
    required String payable_amount}) async {
  printLog('Setting Appointments');

  // return true;

  String setAppointments = '''
       mutation {
         createAppointment(
           doctor_id: "$doctor_id"
           date: "$date"
           patient_id: "$patient_id"
           status: "$status"
           from_time: "$from_time"
           from_time_type: "$from_time_type"
           to_time: "$to_time"
           to_time_type: "$to_time_type"
           description: "$description"
           service_id: "$service_id"
           payment_type: "$payment_type"
           payable_amount: "$payable_amount"
         ) {
           id
         }
       }
  ''';
  print(setAppointments);

  printLog(setAppointments);

  final QueryOptions options = QueryOptions(
    document: gql(setAppointments),
  );
  GraphQLClient graphqlClient = await graphqlAPI.noauthClient();
  debugPrintTransactionStart('mutation Appointments');
  final QueryResult result = await graphqlClient.query(options);
  debugPrintTransactionEnd('mutation Appointments');

  if (result.hasException) {
    printLog(result.exception.toString(), name: 'mutation Appointments');
    // snackBar(context, message: result.exception.toString());
    return false;
  }

  final json = result.data!["createAppointment"]["id"];
  print(json);
  var app_id = json;
  printLog('createAppointment ${json}');

  String createRoomMutation = '''
    mutation {
      createroom(appointment_id: "$app_id") 
    }
  ''';
  print(createRoomMutation);
  final QueryOptions roomOptions = QueryOptions(
    document: gql(createRoomMutation),
  );

  final QueryResult roomResult = await graphqlClient.query(roomOptions);
  print("roomRes awaited");
  if (roomResult.hasException) {
    print(roomResult.exception.toString());
    printLog(roomResult.exception.toString(), name: 'Room mutation');
    return false;
  }
  print("still here");
  String roomId = jsonDecode(roomResult.data!["createroom"])["id"];
  print(roomId);
  printLog('Created Room $roomId');

  return true;
}

Future<bool> getAppointmentsD({required String doctorId}) async {
  // TODO уменьшить клоичество данных за счет спецмалищации и переделать соотыетственно модель доторов
  String getAppointments = '''
        query appointments {
          appointmentsbydoctor(doctor_id: "$doctorId") {
                    id
                    appointment_unique_id
                    	patient {
                      patientUser {
                        id
                        full_name 
                        first_name
                        profile_image
                      
                      }
                    }
                    doctor {
                        doctor_id: id
                        specializations {
                            name
                        }
                        doctorUser {
                            user_id: id 
                            username: full_name
                            first_name
                            last_name
                            photo: profile_image
                        }
                    }
                    description
                    status
                    from_time
                    from_time_type
                    to_time
                    to_time_type
                    room_data
                }
              }
      ''';
  print(getAppointments);
  final QueryOptions options = QueryOptions(
    document: gql(getAppointments),
  );

  GraphQLClient graphqlClient = await graphqlAPI.noauthClient();

  debugPrintTransactionStart('query appointments');
  final QueryResult result = await graphqlClient.query(options);
  debugPrintTransactionEnd('query appointments');

  if (result.hasException) {
    printLog(result.exception.toString(), name: 'query appointments');
    return false;
  }

  final json = result.data!["appointmentsbydoctor"];
  printLog("result:");
  printLog(json);

  AppointmentsStore storeAppointmentsStore = getIt.get<AppointmentsStore>();

  storeAppointmentsStore.clearAppointmentsData();
  print(json);
  json.forEach((appointment) {
    AppointmentModel appointmentModel = AppointmentModel.fromJson(appointment);
    storeAppointmentsStore
        .addAppointmentToAppointmentsData(appointmentModel.toJson());
  });

  return true;
}

Future<bool> getAppointments({required String patientId}) async {
  // TODO уменьшить клоичество данных за счет спецмалищации и переделать соотыетственно модель доторов
  String getAppointments = '''
        query appointments {
          appointments(patient_id: "$patientId") {
                    id
                    date
                    appointment_unique_id
                    	patient {
                      patientUser {
                        id
                        full_name 
                        first_name
                        profile_image
                      
                      }
                    }
                    doctor {
                        doctor_id: id
                        specializations {
                            name
                        }
                        doctorUser {
                            user_id: id 
                            username: full_name
                            first_name
                            last_name
                            photo: profile_image
                        }
                    }
                    description
                    status
                    from_time
                    from_time_type
                    to_time
                    to_time_type
                      room_data
                }
              }
      ''';
  print(getAppointments);
  print("it was query");
  final QueryOptions options = QueryOptions(
    document: gql(getAppointments),
  );

  GraphQLClient graphqlClient = await graphqlAPI.noauthClient();

  debugPrintTransactionStart('query appointments');
  final QueryResult result = await graphqlClient.query(options);
  debugPrintTransactionEnd('query appointments');

  if (result.hasException) {
    printLog(result.exception.toString(), name: 'query appointments');
    return false;
  }

  final json = result.data!["appointments"];
  printLog("result:");
  printLog(json);

  AppointmentsStore storeAppointmentsStore = getIt.get<AppointmentsStore>();

  storeAppointmentsStore.clearAppointmentsData();

  json.forEach((appointment) {
    AppointmentModel appointmentModel = AppointmentModel.fromJson(appointment);
    storeAppointmentsStore
        .addAppointmentToAppointmentsData(appointmentModel.toJson());
  });

  return true;
}
