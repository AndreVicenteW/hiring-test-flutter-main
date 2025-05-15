import 'package:foxbit_hiring_test_template/domain/entities/instrument_details_entity.dart';

class InstrumentDetailsDto {
  final int? instrumentId;
  final double? lastTradedPx;
  final double? rolling24HrVolume;
  final double? rolling24HrPxChange;

  InstrumentDetailsDto(
    this.instrumentId,
    this.lastTradedPx,
    this.rolling24HrVolume,
    this.rolling24HrPxChange,
  );

  factory InstrumentDetailsDto.fromJson(Map<String, dynamic> json) {
    return InstrumentDetailsDto(
      json['InstrumentId'] as int?,
      getDoubleValue(json['LastTradedPx']),
      getDoubleValue(json['Rolling24HrVolume']),
      getDoubleValue(json['Rolling24HrPxChange']),
    );
  }

  InstrumentDetailsEntity toEntity() {
    return InstrumentDetailsEntity(
      instrumentId: instrumentId ?? 0,
      lastTradedPx: lastTradedPx ?? 0,
      rolling24HrVolume: rolling24HrVolume ?? 0,
      rolling24HrPxChange: rolling24HrPxChange ?? 0,
    );
  }
}

double getDoubleValue(dynamic value) {
  double returnValue = 0;

  if (value is double) {
    returnValue = value;
  } else if (value is String) {
    returnValue = double.parse(value);
  } else if (value is int) {
    returnValue = value.toDouble();
  }

  return returnValue;
}
