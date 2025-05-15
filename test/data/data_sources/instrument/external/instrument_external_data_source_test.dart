import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/data/constants.dart';
import 'package:foxbit_hiring_test_template/data/data_sources/instrument/external/instrument_external_data_source.dart';
import 'package:foxbit_hiring_test_template/data/dtos/instrument_details_dto.dart';
import 'package:foxbit_hiring_test_template/data/dtos/instrument_dto.dart';
import 'package:foxbit_hiring_test_template/data/services/websocket/websocket_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/instrument_mock.dart';

class MockWebSocketService extends Mock implements WebSocketService {}

void main() {
  final webSocketService = MockWebSocketService();
  final instrumentExternalDataSource =
      InstrumentExternalDataSource(webSocketService);

  group('Instrument External Data Source getInstruments test', () {
    test('Should call onReceived and return a List<InstrumentDto>', () async {

      //mocking stream return
      when(() => webSocketService.stream).thenAnswer(
        (_) => Stream.value(getInstrumentsListMock),
      );

      //call function
      await instrumentExternalDataSource.getInstruments((data) {
        //expect
        expect(data, isA<List<InstrumentDto>>());
        expect(data.length, 2);
      });
    });

    test('Should throw exception', () async {

      //mocking stream exception
      when(() => webSocketService.send(getInstrumentsMethod, any()))
          .thenThrow(Exception("Error"));

      //expect exception
      expect(
        () async =>
            await instrumentExternalDataSource.getInstruments((data) {}),
        throwsException,
      );
    });
  });

  group('Instrument External Data Source listenUpdates test', () {
    test('Should call onReceived and return a InstrumentDetailsDto', () async {

      //mocking stream return
      when(() => webSocketService.stream).thenAnswer(
            (_) => Stream.value(subscribeLevel1MethodMock),
      );

      //call function
      await instrumentExternalDataSource.listenUpdates(1, (data) {
        //expect
        expect(data, isA<InstrumentDetailsDto>());
      });
    });

    test('Should throw exception', () async {

      //mocking stream exception
      when(() => webSocketService.send(subscribeLevel1Method, any()))
          .thenThrow(Exception("Error"));

      //expect exception
      expect(
            () async =>
        await instrumentExternalDataSource.listenUpdates(1, (data) {}),
        throwsException,
      );
    });
  });
}
