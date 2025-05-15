import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/quotation_page.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_list.dart';
import 'package:foxbit_hiring_test_template/app/utils/base_cubit_state.dart';
import 'package:foxbit_hiring_test_template/app/widgets/loader.dart';

import '../../../mocks/instrument_mock.dart';
import '../../../utils/instrument_item_cubit_helper.dart';
import '../../../utils/quotation_cubit_helper.dart';
import '../../../utils/tester_helper.dart';

void main() {
  final quotationCubitHelper = QuotationCubitHelper();
  final instrumentItemCubitHelper = InstrumentItemCubitHelper();

  setUpAll(() {
    quotationCubitHelper.initialStateMock();

    instrumentItemCubitHelper
      ..initialStateMock()
      ..mockState(
        SuccessState(instrumentDetailsEntityMock),
      );
  });

  Future<void> initWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      TesterHelper().buildTestableWidget(
        const QuotationPage(),
      ),
    );
  }

  group('Quotation Page test', () {
    testWidgets('Should see all widgets on SuccessState', (tester) async {
      quotationCubitHelper.mockState(
        SuccessState(instrumentEntityListMock),
      );

      await initWidget(tester);

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(InstrumentList), findsOneWidget);
    });

    testWidgets('Should see LoadingIndicator on LoadingState', (tester) async {

      quotationCubitHelper.mockState(
        LoadingState(),
      );

      await initWidget(tester);

      expect(find.byType(LoadingIndicator), findsOneWidget);
    });

    testWidgets('Should see an Error message on ErrorState', (tester) async {

      quotationCubitHelper.mockState(
        ErrorState("Error test"),
      );

      await initWidget(tester);

      expect(find.text("Error test"), findsOneWidget);
    });
  });
}
