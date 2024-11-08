import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallet/models/topup_form_model.dart';
import 'package:wallet/services/auth_service.dart';
import 'package:wallet/shared/shared_values.dart';

class TransactionService {
  Future<String> topUp(TopupFormModel data) async {
    try {
      // Validasi apakah data sudah lengkap
      if (!data.isValid()) {
        throw 'Top-up form data is incomplete';
      }

      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/top_ups'),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        final responseBody = jsonDecode(res.body);
        final redirectUrl = responseBody['redirect_url'];

        // Pastikan redirect_url tidak null
        if (redirectUrl != null) {
          return redirectUrl;
        } else {
          throw 'Redirect URL is missing';
        }
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print('Error during top-up: $e');  // Menambahkan log error
      rethrow;
    }
  }
}
