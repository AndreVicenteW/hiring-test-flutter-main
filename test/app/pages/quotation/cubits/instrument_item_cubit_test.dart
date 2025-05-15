import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/cubits/instrument_item_cubit.dart';
import 'package:foxbit_hiring_test_template/app/utils/base_cubit_state.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_details_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/instrument_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/instrument_mock.dart';

class MockInstrumentUseCase extends Mock implements InstrumentUseCase {}

void main() {
  final instrumentUseCase = MockInstrumentUseCase();

  group('Instrument Item Cubit test', () {
    blocTest(
      'Should emit [LoadingState, SuccessState] when listenUpdates is called',
      build: () => InstrumentItemCubitImpl(instrumentUseCase),
      setUp: () {
        when(() => instrumentUseCase.listenUpdates(any(), any()))
            .thenAnswer((_) async => true);
      },
      act: (cubit) {
        cubit.listenUpdates(1);
        cubit.returnSuccessData(instrumentDetailsEntityMock);
      },
      expect: () => [
        isA<LoadingState>(),
        isA<SuccessState<InstrumentDetailsEntity>>(),
      ],
    );
  });


}
