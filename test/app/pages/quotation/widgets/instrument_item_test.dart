import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_item.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_item_details.dart';
import 'package:foxbit_hiring_test_template/app/utils/base_cubit_state.dart';

import '../../../../mocks/instrument_mock.dart';
import '../../../../utils/instrument_item_cubit_helper.dart';
import '../../../../utils/tester_helper.dart';

void main() {
  final instrumentItemCubitHelper = InstrumentItemCubitHelper();

  setUp(() {
    instrumentItemCubitHelper.initialStateMock();
  });

  group('Instrument Item test', () {
    testWidgets('Should see all widgets', (tester) async {
      instrumentItemCubitHelper.mockState(
        SuccessState(instrumentDetailsEntityMock),
      );

      await tester.pumpWidget(
        TesterHelper().buildTestableWidget(
          InstrumentItem(
            instrumentEntity: instrumentEntityMock,
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      // there are more 2 inside InstrumentItemDetails
      expect(find.byType(Text), findsNWidgets(4));
      expect(find.byType(InstrumentItemDetails), findsOneWidget);
    });
  });
}
