import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxbit_hiring_test_template/app/utils/base_cubit_state.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/instrument_usecase.dart';

abstract class QuotationCubit extends Cubit<BaseCubitState> {
  QuotationCubit(super.initialState);

  Future<void> getInstruments();

  Future<void> closeConnection();
}

class QuotationCubitImpl extends QuotationCubit {
  final InstrumentUseCase _instrumentUseCase;

  QuotationCubitImpl(
    this._instrumentUseCase,
  ) : super(InitialState()) {
    _instrumentUseCase.initWSConnection();
  }

  @override
  Future<void> getInstruments() async {
    emit(LoadingState());

    await _instrumentUseCase.getInstruments(returnSuccessData);
  }

  void returnSuccessData(List<InstrumentEntity> listInstrumentEntity) {
    emit(SuccessState(listInstrumentEntity));
  }

  @override
  Future<void> closeConnection() async {
    _instrumentUseCase.closeWSConnection();
  }
}
