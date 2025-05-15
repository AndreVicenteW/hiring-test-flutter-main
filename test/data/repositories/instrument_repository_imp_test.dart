import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/data/data_sources/instrument/external/instrument_external_data_source.dart';
import 'package:foxbit_hiring_test_template/data/repositories/instrument_repository_imp.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_details_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/instrument_mock.dart';
import '../data_sources/instrument/external/instrument_external_data_source_test.dart';

void main() {
  final webSocketService = MockWebSocketService();
  final instrumentExternalDataSource =
      InstrumentExternalDataSource(webSocketService);
  final instrumentRepository = InstrumentRepositoryImpl(instrumentExternalDataSource);

  group('Instrument Repository getInstruments test', () {
    test('Should transform a List<InstrumentDto> to List<InstrumentEntity>', () async {

      //mocking stream return
      when(() => webSocketService.stream).thenAnswer(
            (_) => Stream.value(getInstrumentsListMock),
      );

      //call function
      await instrumentRepository.getInstruments((data) {
        //expect
        expect(data, isA<List<InstrumentEntity>>());
        expect(data.length, 2);
      });
    });
  });

  group('Instrument Repository listenUpdates test', () {
    test('Should transform an InstrumentDetailsDto to InstrumentDetailsEntity', () async {

      //mocking stream return
      when(() => webSocketService.stream).thenAnswer(
            (_) => Stream.value(subscribeLevel1MethodMock),
      );

      //call function
      await instrumentRepository.listenUpdates(1, (data) {
        //expect
        expect(data, isA<InstrumentDetailsEntity>());
      });
    });
  });
}
