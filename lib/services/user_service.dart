import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallet/models/user_edit_form_model.dart';
import 'package:wallet/models/user_model.dart';
import 'package:wallet/services/auth_service.dart';
import 'package:wallet/shared/shared_values.dart';

class UserService {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
          Uri.parse(
            '$baseUrl/users',
          ),
          body: data.toJson(),
          headers: {
            'Authorization': token,
          });
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getRecentUsers({int limit = 10}) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/transfers_histories?limit=$limit'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        return List<UserModel>.from(
          body['data'].map((user) => UserModel.fromJson(user)),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUsersByUsername(String username) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
          Uri.parse(
            '$baseUrl/users/$username',
          ),
          headers: {
            'Authorization': token,
          });

      if (res.statusCode == 200) {
        return List<UserModel>.from(
          jsonDecode(res.body).map(
            (user) => UserModel.fromJson(user),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

//   Future<List<UserModel>> getUsersByUsername(String username) async {
//   try {
//     final token = await AuthService().getToken();
//     print('Token: $token');  // Log token untuk memastikan valid

//     final res = await http.get(
//         Uri.parse(
//           '$baseUrl/users/$username',
//         ),
//         headers: {
//           'Authorization': token,
//         });

//     print('Response: ${res.body}');  // Log responsenya

//     if (res.statusCode == 200) {
//       return List<UserModel>.from(
//         jsonDecode(res.body).map(
//           (user) => UserModel.fromJson(user),
//         ),
//       );
//     }

//     throw jsonDecode(res.body)['message'];
//   } catch (e) {
//     print('Error: $e');
//     rethrow;
//   }
// }

}
