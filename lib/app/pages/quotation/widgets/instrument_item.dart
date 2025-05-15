import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_item_details.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';

class InstrumentItem extends StatelessWidget {
  final InstrumentEntity instrumentEntity;

  const InstrumentItem({
    super.key,
    required this.instrumentEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/${instrumentEntity.id}.png",
            width: 30,
          ),
          const SizedBox(
            width: 8,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 90,
              maxWidth: 90,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  instrumentEntity.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(instrumentEntity.getSymbol),
              ],
            ),
          ),
          InstrumentItemDetails(instrumentId: instrumentEntity.id),
        ],
      ),
    );
  }
}
