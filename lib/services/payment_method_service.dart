import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallet/models/payment_method_model.dart';
import 'package:wallet/services/auth_service.dart';
import 'package:wallet/shared/shared_values.dart';

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
          Uri.parse(
            '$baseUrl/payment_methods',
          ),
          headers: {
            'Authorization': token,
          });

      if (res.statusCode == 200) {
        return List<PaymentMethodModel>.from(jsonDecode(res.body).map(
                (paymentMethod) => PaymentMethodModel.fromJson(paymentMethod)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
