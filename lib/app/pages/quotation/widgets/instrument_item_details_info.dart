import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_details_entity.dart';

class InstrumentItemDetailsInfo extends StatelessWidget {
  final InstrumentDetailsEntity instrumentDetailsEntity;

  const InstrumentItemDetailsInfo({
    super.key,
    required this.instrumentDetailsEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            instrumentDetailsEntity.variation,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: instrumentDetailsEntity.isPositive
                  ? Colors.green
                  : Colors.red,
            ),
          ),
          Text(
            instrumentDetailsEntity.currency,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
