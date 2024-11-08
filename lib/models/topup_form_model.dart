class TopupFormModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  TopupFormModel({
    this.amount,
    this.pin,
    this.paymentMethodCode,
  });

  // Perbaikan typo di paymentMethodCode
  TopupFormModel copyWith({
    String? amount,
    String? pin,
    String? paymentMethodCode, // Fix typo
  }) =>
      TopupFormModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode, // Fix typo
      );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'pin': pin,
    'payment_method_code': paymentMethodCode,
  };

  // Menambahkan pengecekan null pada model sebelum digunakan
  bool isValid() {
    return amount != null && pin != null && paymentMethodCode != null;
  }
}
