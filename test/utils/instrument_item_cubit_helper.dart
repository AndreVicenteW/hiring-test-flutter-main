import 'package:bloc_test/bloc_test.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/cubits/instrument_item_cubit.dart';
import 'package:foxbit_hiring_test_template/app/utils/base_cubit_state.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockInstrumentItemCubit extends Mock implements InstrumentItemCubit {}

class InstrumentItemCubitHelper {
  final instrumentItemCubit = MockInstrumentItemCubit();

  void initialStateMock() {
    GetIt.instance.registerFactory<InstrumentItemCubit>(
      () => instrumentItemCubit,
    );

    when(
      () => instrumentItemCubit.listenUpdates(any()),
    ).thenAnswer((_) async => true);

    when(
      () => instrumentItemCubit.close(),
    ).thenAnswer((_) async => true);

    whenListen(
      instrumentItemCubit,
      Stream.value(InitialState()),
    );
  }

  void mockState(BaseCubitState mockReturn) {
    when(
      () => instrumentItemCubit.state,
    ).thenReturn(mockReturn);
  }
}
