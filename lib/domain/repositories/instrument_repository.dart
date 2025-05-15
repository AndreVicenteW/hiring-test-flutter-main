import 'package:foxbit_hiring_test_template/domain/entities/instrument_details_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';

abstract class InstrumentRepository {
  void initWSConnection();

  Future<void> getInstruments(
    Function(List<InstrumentEntity> instruments) onReceived,
  );

  Future<void> listenUpdates(
    int instrumentId,
    Function(InstrumentDetailsEntity instrumentDetails) onReceived,
  );

  void closeWSConnection();
}
