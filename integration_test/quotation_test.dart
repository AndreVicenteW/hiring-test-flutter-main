import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/app/application.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_list.dart';
import 'package:foxbit_hiring_test_template/app/widgets/loader.dart';
import 'package:foxbit_hiring_test_template/di.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    //Initialize dependency injection
    setupDI();
  });

  group('Quotation integration test', () {
    testWidgets('A list of instruments should appear', (tester) async {
      // Load FoxbitApp widget.
      await tester.pumpWidget(FoxbitApp());

      // check loader
      expect(find.byType(LoadingIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      // check if InstrumentList appears
      expect(find.byType(InstrumentList), findsOneWidget);
    });
  });
}
