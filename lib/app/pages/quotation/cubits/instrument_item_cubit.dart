import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxbit_hiring_test_template/app/utils/base_cubit_state.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_details_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/instrument_usecase.dart';

abstract class InstrumentItemCubit extends Cubit<BaseCubitState> {
  InstrumentItemCubit(super.initialState);

  Future<void> listenUpdates(int id);
}

class InstrumentItemCubitImpl extends InstrumentItemCubit {
  final InstrumentUseCase _instrumentUseCase;

  InstrumentItemCubitImpl(this._instrumentUseCase) : super(InitialState());

  @override
  Future<void> listenUpdates(int id) async {
    emit(LoadingState());

    await _instrumentUseCase.listenUpdates(id, returnSuccessData);
  }

  void returnSuccessData(InstrumentDetailsEntity entity) {
    emit(SuccessState(entity));
  }
}
