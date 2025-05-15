import 'package:foxbit_hiring_test_template/data/dtos/instrument_details_dto.dart';
import 'package:foxbit_hiring_test_template/data/dtos/instrument_dto.dart';

abstract class InstrumentDataSource {
  void initWSConnection();

  Future<void> getInstruments(
    Function(List<InstrumentDto> instruments) onReceived,
  );

  Future<void> listenUpdates(
    int instrumentId,
    Function(InstrumentDetailsDto instrumentDetails) onReceived,
  );

  void closeWSConnection();
}
