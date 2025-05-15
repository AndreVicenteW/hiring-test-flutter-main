import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_item_details.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_item_details_info.dart';
import 'package:foxbit_hiring_test_template/app/utils/base_cubit_state.dart';
import 'package:foxbit_hiring_test_template/app/widgets/loader.dart';

import '../../../../mocks/instrument_mock.dart';
import '../../../../utils/instrument_item_cubit_helper.dart';
import '../../../../utils/tester_helper.dart';

void main() {

  final instrumentItemCubitHelper = InstrumentItemCubitHelper();

  setUpAll(() {
    instrumentItemCubitHelper.initialStateMock();
  });

  Future<void> initWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      TesterHelper().buildTestableWidget(
        const Column(
          children: [
            InstrumentItemDetails(
              instrumentId: 1,
            ),
          ],
        ),
      ),
    );
  }

  group('Instrument Item Details test', () {
    testWidgets('Should see all widgets on SuccessState', (tester) async {

      instrumentItemCubitHelper.mockState(
        SuccessState(instrumentDetailsEntityMock),
      );

      await initWidget(tester);

      // there are 2 inside InstrumentItemDetailsInfo
      expect(find.byType(Text), findsNWidgets(2));
      expect(find.byType(InstrumentItemDetailsInfo), findsOneWidget);
    });

    testWidgets('Should see LoadingIndicator on LoadingState', (tester) async {

      instrumentItemCubitHelper.mockState(
        LoadingState(),
      );

      await initWidget(tester);

      expect(find.byType(Text), findsNothing);
      expect(find.byType(LoadingIndicator), findsOneWidget);
    });

    testWidgets('Should see an Error message on ErrorState', (tester) async {

      instrumentItemCubitHelper.mockState(
        ErrorState("Error test"),
      );

      await initWidget(tester);

      expect(find.text("Error test"), findsOneWidget);
    });
  });
}
