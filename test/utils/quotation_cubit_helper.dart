import 'package:bloc_test/bloc_test.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/cubits/quotation_cubit.dart';
import 'package:foxbit_hiring_test_template/app/utils/base_cubit_state.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockQuotationCubit extends Mock implements QuotationCubit {}

class QuotationCubitHelper {
  final quotationCubit = MockQuotationCubit();

  void initialStateMock() {
    GetIt.instance.registerFactory<QuotationCubit>(
      () => quotationCubit,
    );

    when(
      () => quotationCubit.getInstruments(),
    ).thenAnswer((_) async => true);

    when(
      () => quotationCubit.closeConnection(),
    ).thenAnswer((_) async => true);

    when(
      () => quotationCubit.close(),
    ).thenAnswer((_) async => true);

    whenListen(
      quotationCubit,
      Stream.value(InitialState()),
    );
  }

  void mockState(BaseCubitState mockReturn) {
    when(
      () => quotationCubit.state,
    ).thenReturn(mockReturn);
  }
}
