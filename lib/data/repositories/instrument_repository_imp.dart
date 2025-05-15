import 'package:foxbit_hiring_test_template/data/data_sources/instrument/instrument_data_source.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_details_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/instrument_repository.dart';

class InstrumentRepositoryImpl implements InstrumentRepository {
  final InstrumentDataSource _instrumentDataSource;

  InstrumentRepositoryImpl(this._instrumentDataSource);

  @override
  void initWSConnection() {
    _instrumentDataSource.initWSConnection();
  }

  @override
  Future<void> getInstruments(
    Function(List<InstrumentEntity> instruments) onReceived,
  ) async {

    await _instrumentDataSource.getInstruments((instrumentDtoList) {
      final instrumentList = instrumentDtoList
          .map((instrumentDto) => instrumentDto.toEntity())
          .toList();

      onReceived(instrumentList);
    });
  }

  @override
  Future<void> listenUpdates(
    int instrumentId,
    Function(InstrumentDetailsEntity instrument) onReceived,
  ) async {
    await _instrumentDataSource.listenUpdates(instrumentId, (instrumentDto) {
      onReceived(instrumentDto.toEntity());
    });
  }

  @override
  void closeWSConnection() {
    _instrumentDataSource.closeWSConnection();
  }
}
