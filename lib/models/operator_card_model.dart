import 'package:wallet/models/data_plan_model.dart';

class OperatorCardModel {
  final int id;
  final String name;
  final String? status;
  final String? thumbnail;
  final List<DataPlanModel>? dataPlans;

  OperatorCardModel({
    required this.id,
    required this.name,
    this.status,
    this.thumbnail,
    this.dataPlans,
  });

  factory OperatorCardModel.fromJson(Map<String, dynamic> json) {
    return OperatorCardModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown', 
      status: json['status'] as String?,
      thumbnail: json['thumbnail'] as String?,
      dataPlans: (json['data_plans'] as List<dynamic>?)
          ?.map((dataPlan) => DataPlanModel.fromJson(dataPlan))
          .toList(),
    );
  }
}
