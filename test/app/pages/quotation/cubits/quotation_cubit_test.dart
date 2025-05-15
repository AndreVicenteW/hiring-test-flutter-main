import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/cubits/quotation_cubit.dart';
import 'package:foxbit_hiring_test_template/app/utils/base_cubit_state.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/instrument_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/instrument_mock.dart';

class MockInstrumentUseCase extends Mock implements InstrumentUseCase {}

void main() {
  final instrumentUseCase = MockInstrumentUseCase();

  group('Quotation Item Cubit test', () {
    blocTest(
      'Should emit [LoadingState, SuccessState] when getInstruments is called',
      build: () => QuotationCubitImpl(instrumentUseCase),
      setUp: () {
        when(() => instrumentUseCase.getInstruments(any()))
            .thenAnswer((_) async => true);
      },
      act: (cubit) {
        cubit.getInstruments();
        cubit.returnSuccessData(instrumentEntityListMock);
      },
      expect: () => [
        isA<LoadingState>(),
        isA<SuccessState<List<InstrumentEntity>>>(),
      ],
    );
  });


}
