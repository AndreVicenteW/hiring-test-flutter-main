import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';

class InstrumentDto {
  final int? instrumentId;
  final String? symbol;
  final int? sortIndex;

  InstrumentDto(
    this.instrumentId,
    this.symbol,
    this.sortIndex,
  );

  factory InstrumentDto.fromJson(Map<String, dynamic> json) => InstrumentDto(
        json['InstrumentId'] as int?,
        json['Symbol'] as String?,
        json['SortIndex'] as int?,
      );

  InstrumentEntity toEntity() {
    return InstrumentEntity(
      id: instrumentId ?? 0,
      symbol: symbol ?? '',
      index: sortIndex ?? 0,
    );
  }
}
