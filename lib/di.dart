import 'package:foxbit_hiring_test_template/app/pages/quotation/cubits/instrument_item_cubit.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/cubits/quotation_cubit.dart';
import 'package:foxbit_hiring_test_template/data/data_sources/instrument/external/instrument_external_data_source.dart';
import 'package:foxbit_hiring_test_template/data/data_sources/instrument/instrument_data_source.dart';
import 'package:foxbit_hiring_test_template/data/repositories/instrument_repository_imp.dart';
import 'package:foxbit_hiring_test_template/data/services/websocket/foxbit/foxbit_websocket.dart';
import 'package:foxbit_hiring_test_template/data/services/websocket/websocket_service.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/instrument_repository.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/instrument_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDI() {
  // Common
  getIt.registerSingleton<WebSocketService>(FoxbitWebSocket());

  // Instruments
  getIt.registerFactory<InstrumentDataSource>(
    () => InstrumentExternalDataSource(getIt()),
  );
  getIt.registerFactory<InstrumentRepository>(
    () => InstrumentRepositoryImpl(getIt()),
  );
  getIt.registerFactory<InstrumentUseCase>(
    () => InstrumentUseCaseImpl(getIt()),
  );

  //Cubits
  getIt.registerFactory<QuotationCubit>(
    () => QuotationCubitImpl(getIt()),
  );
  getIt.registerFactory<InstrumentItemCubit>(
    () => InstrumentItemCubitImpl(getIt()),
  );
}
