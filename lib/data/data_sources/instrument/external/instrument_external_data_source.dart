import 'package:foxbit_hiring_test_template/data/constants.dart';
import 'package:foxbit_hiring_test_template/data/data_sources/instrument/instrument_data_source.dart';
import 'package:foxbit_hiring_test_template/data/dtos/instrument_details_dto.dart';
import 'package:foxbit_hiring_test_template/data/dtos/instrument_dto.dart';
import 'package:foxbit_hiring_test_template/data/services/websocket/websocket_service.dart';

class InstrumentExternalDataSource implements InstrumentDataSource {
  final WebSocketService _webSocketService;

  InstrumentExternalDataSource(this._webSocketService);

  final _validIds = [1, 2, 4, 6, 10];

  @override
  void initWSConnection() {
    _webSocketService.connect();
  }

  @override
  Future<void> getInstruments(
    Function(List<InstrumentDto> instruments) onReceived,
  ) async {
    try {
      //Send method to websocket
      _webSocketService.send(getInstrumentsMethod, {});

      //Listen stream to get new values
      _webSocketService.stream.listen((message) {

        //verify the stream method
        if (message['n'].toString() == getInstrumentsMethod) {

          final resultsList = message["o"] as List;
          final List<InstrumentDto> data = [];

          for (final instrument in resultsList) {
            final instrumentDto = InstrumentDto.fromJson(
              instrument as Map<String, dynamic>,
            );

            //add only valid ids
            if (_validIds.contains(instrument["InstrumentId"])) {
              data.add(instrumentDto);
            }
          }

          onReceived(data);
        }
      });
    } catch (e) {
      throw Exception("Error fetching getInstruments data. $e");
    }
  }

  @override
  Future<void> listenUpdates(
    int instrumentId,
    Function(InstrumentDetailsDto instrumentDetails) onReceived,
  ) async {
    try {
      //Send method and id to websocket
      _webSocketService.send(subscribeLevel1Method, {
        "InstrumentId": instrumentId,
      });

      //Listen stream to get new values
      _webSocketService.stream.listen((message) {

        final method = message['n'].toString();

        //verify the stream method
        if (method == subscribeLevel1Method ||
            method == level1UpdateEventMethod) {

          final result = message["o"] as Map<String, dynamic>;
          final instrument = InstrumentDetailsDto.fromJson(result);

          //verify and return only the correct id
          if (instrument.instrumentId == instrumentId) {
            onReceived(instrument);
          }
        }
      });
    } catch (e) {
      throw Exception("Error listenUpdates. Error: $e");
    }
  }

  @override
  void closeWSConnection() {
    _webSocketService.disconnect();
  }
}
