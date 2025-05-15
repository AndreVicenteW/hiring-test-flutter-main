import 'package:foxbit_hiring_test_template/domain/entities/instrument_details_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/instrument_repository.dart';

abstract class InstrumentUseCase {
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

class InstrumentUseCaseImpl implements InstrumentUseCase {
  final InstrumentRepository _instrumentRepository;

  InstrumentUseCaseImpl(this._instrumentRepository);

  @override
  void initWSConnection() {
    _instrumentRepository.initWSConnection();
  }

  @override
  Future<void> getInstruments(
    Function(List<InstrumentEntity> instruments) onReceived,
  ) async {
    await _instrumentRepository.getInstruments(onReceived);
  }

  @override
  Future<void> listenUpdates(
    int instrumentId,
    Function(InstrumentDetailsEntity instrumentDetails) onReceived,
  ) async {
    await _instrumentRepository.listenUpdates(instrumentId, onReceived);
  }

  @override
  void closeWSConnection() {
    _instrumentRepository.closeWSConnection();
  }
}
