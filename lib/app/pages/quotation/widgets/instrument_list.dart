import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_item.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';

class InstrumentList extends StatelessWidget {
  final List<InstrumentEntity> instrumentList;

  const InstrumentList({
    super.key,
    required this.instrumentList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: instrumentList.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemBuilder: (context, index) {
        final instrument = instrumentList[index];

        return InstrumentItem(instrumentEntity: instrument);
      },
    );
  }
}
