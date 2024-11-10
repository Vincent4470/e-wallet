class TransferFormModel {
  final String? amount;
  final String? pin;
  final String? sendTo;

  TransferFormModel({
    this.amount,
    this.pin,
    this.sendTo,
  });

  // Perbaikan typo di paymentMethodCode
  TransferFormModel copyWith({
    String? amount,
    String? pin,
    String? sendTo, 
  }) =>
      TransferFormModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        sendTo: sendTo ?? this.sendTo, 
      );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'pin': pin,
    'send_to': sendTo,
  };

  // Menambahkan pengecekan null pada model sebelum digunakan
  bool isValid() {
    return amount != null && pin != null && sendTo != null;
  }
}
