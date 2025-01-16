import 'dart:developer';

class DoctorModel {
  DoctorModel({
    this.doctorId,
    this.specializations,
    this.userId,
    this.userName,
    this.firstName,
    this.lastName,
    this.photo,
  });

  String? doctorId;
  List<String>? specializations;
  String? userId;
  String? userName;
  String? firstName;
  String? lastName;
  String? photo;
  


  DoctorModel.fromJson(Map json) {
    doctorId = json['doctor_id'];

    if (json['specializations'] != null) {
      specializations = [];
      json["specializations"].forEach((specializationsElement) {
        specializations!.add(specializationsElement['name']);
      });
    }

    userId = json['doctorUser']['user_id'];
    userName = json['doctorUser']['username'];
    firstName = json['doctorUser']['first_name'];
    lastName = json['doctorUser']['last_name'];
    photo = json['doctorUser']['photo'];
  }

  Map toJson() {
    var specializationsList = [];
    for (var specializationsElement in specializations!) {
      specializationsList.add({
        'name': specializationsElement,
      });
    }
    var map = {
      'doctor_id': doctorId,
      'specializations': specializationsList,
      'user_id': userId,
      'username': userName,
      'first_name': firstName,
      'last_name': lastName,
      'photo': photo,
    };
    
    return map;
  }
}

// class UserRole {
//   String? name;

//   UserRole({
//     this.name,
//   });

//   Map toJson() => {
//         'name': name,
//       };

//   UserRole.fromJson(Map json) : name = json['name'];

//   @override
//   String toString() {
//     return 'UserRole{ name: $name }';
//   }
// }
