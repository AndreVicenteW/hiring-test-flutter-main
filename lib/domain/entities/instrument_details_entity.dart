import 'package:intl/intl.dart';

class InstrumentDetailsEntity {
  final int instrumentId;
  final double lastTradedPx;
  final double rolling24HrVolume;
  final double rolling24HrPxChange;

  InstrumentDetailsEntity({
    required this.instrumentId,
    required this.lastTradedPx,
    required this.rolling24HrVolume,
    required this.rolling24HrPxChange,
  });

  //get last trade on pt_br format
  String get currency => NumberFormat.simpleCurrency(
        locale: 'pt_br',
      ).format(lastTradedPx);

  //get variation with 2 decimals
  String get variation =>
      "${isPositive ? "+" : ""}${rolling24HrPxChange.toStringAsFixed(2)}";

  //check if variation is positive
  bool get isPositive => rolling24HrPxChange >= 0;
}
