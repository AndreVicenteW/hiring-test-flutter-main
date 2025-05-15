import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_item_details_info.dart';

import '../../../../mocks/instrument_mock.dart';
import '../../../../utils/tester_helper.dart';

void main() {

  group('Instrument Item Details Info test', () {
    testWidgets('Should see all widgets', (tester) async {

      await tester.pumpWidget(
        TesterHelper().buildTestableWidget(
          Column(
            children: [
              InstrumentItemDetailsInfo(
                instrumentDetailsEntity: instrumentDetailsEntityMock,
              ),
            ],
          ),
        ),
      );

      expect(find.byType(Text), findsNWidgets(2));
    });
  });
}
