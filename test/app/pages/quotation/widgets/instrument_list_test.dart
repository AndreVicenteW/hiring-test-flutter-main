import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_item.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_list.dart';
import 'package:foxbit_hiring_test_template/app/utils/base_cubit_state.dart';

import '../../../../mocks/instrument_mock.dart';
import '../../../../utils/instrument_item_cubit_helper.dart';
import '../../../../utils/tester_helper.dart';

void main() {
  final instrumentItemCubitHelper = InstrumentItemCubitHelper();

  setUp(() {
    instrumentItemCubitHelper.initialStateMock();
  });

  group('Instrument List test', () {
    testWidgets('Should see all widgets', (tester) async {
      instrumentItemCubitHelper.mockState(
        SuccessState(instrumentDetailsEntityMock),
      );

      await tester.pumpWidget(
        TesterHelper().buildTestableWidget(
          InstrumentList(
            instrumentList: instrumentEntityListMock,
          ),
        ),
      );

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(InstrumentItem),
          findsNWidgets(instrumentEntityListMock.length));
    });
  });
}
