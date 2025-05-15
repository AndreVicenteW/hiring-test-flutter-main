import 'package:foxbit_hiring_test_template/domain/enums/instrument_names_enum.dart';

class InstrumentEntity {
  final int id;
  final String symbol;
  final int index;

  InstrumentEntity({
    required this.id,
    required this.symbol,
    required this.index,
  });

  //get the right symbol
  String get getSymbol => symbol.split("/")[0];

  //get the instrument name from enum
  String get name =>
      InstrumentNames.values.asNameMap()[getSymbol.toLowerCase()]?.name ?? '';
}
