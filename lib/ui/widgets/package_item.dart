import 'package:flutter/material.dart';
import 'package:wallet/models/data_plan_model.dart';
import 'package:wallet/shared/shared_metod.dart';
import 'package:wallet/shared/theme.dart';

class PackageItem extends StatelessWidget {
  final DataPlanModel dataPlan;
  final bool isSelected;

  const PackageItem({
    super.key,
    this.isSelected = false,
    required this.dataPlan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 155,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dataPlan.name.toString(),
            style: blackTextStyle.copyWith(
              fontSize: 32,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            formatCurrency(dataPlan.price ?? 0),
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
