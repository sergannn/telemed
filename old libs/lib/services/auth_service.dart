import 'dart:convert';

import 'package:doctorq/models/user_model.dart';
import 'package:doctorq/services/session.dart';
import 'package:doctorq/stores/user_store.dart';
import 'package:doctorq/utils/utility.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

import '../constant/constants.dart';

GetIt getIt = GetIt.instance;

Future<bool> authUser(
    BuildContext context, String username, String password) async {
  // try {
  printLog(username);
  printLog(password);

  // String loginString = '''
  //       mutation LoginUser {

  //         login(input: {username: "$username", password: "$password"}) {

  String loginString = '''

            mutation {
                loginwithuserresult(input: {
                    email: "patient@infycare.com"
                    password: "123456"
                }) {
                    token
                    user {
                        user_id: id
                        username: full_name
                        email
                        first_name
                        last_name
                        photo: profile_image
                        patient_id
                    }

                }
            }
            
      ''';
  print(loginString);
  final MutationOptions options = MutationOptions(
    document: gql(loginString),
  );
  GraphQLClient graphqlClient = await graphqlAPI.noauthClient();
  debugPrintTransactionStart('mutation login');
  final QueryResult result = await graphqlClient.mutate(options);
  debugPrintTransactionEnd('mutation login');

  printLog(result.toString());

  if (result.hasException) {
    printLog(result.exception.toString());
    //УДАЛЕНИЕ ТУТ И ТАМ и проверить что всякое такое как популярные категории удалилось
    final errorMessages = {
      'incorrect_password': 'Неверный пароль.',
      'invalid_email': 'Неверный email.',
      'Internal server error': 'Ошибка сети или сервера.',
    };
    print(result.exception.toString());
    snackBar(context,
        message: "error",
//        message: errorMessages[result.exception] as String,
//            errorMessages[result.exception?.graphqlErrors[0].message] as String,
        color: Colors.red);
    return false;
  }

  Map<String, dynamic> json = result.data!["loginwithuserresult"];

  UserModel user = UserModel.fromJson(json);
  await Session().saveUser(user);

  final userStore = getIt<UserStore>();
  userStore.setUserData(user.toJson());
  //  {access_token: 7|XCLsXEtFXjCjOAglILNyxmsNDsKT9LDC6xCteAKEddaa9eda, user_id: 3, username: patient@infycare.com, photo: https://cdn.profi.ru/xfiles/pfiles/10c8fcca7d424731bd1c38eba954501b.jpg-profi_a34-320.jpg, name: null}
  // // inputDeviceToken(); // future for push notifications need token
  // Session.data.setString("user_json", jsonEncode(user.toJson()));

  return true;
  // } catch (error) {
  //   printLog(error.toString());
  //   snackBar(context,
  //       message: 'Что то пошло не так. Проверьте данные для входа.',
  //       color: Colors.red);
  //       return false;
  // }
}

Future<String?> logOut() async {
  Session().removeUser();
  printLog('Logging out');
  return 'logged out';
}
