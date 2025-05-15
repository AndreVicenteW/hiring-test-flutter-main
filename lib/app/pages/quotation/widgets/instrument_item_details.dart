import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/cubits/instrument_item_cubit.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_item_details_info.dart';
import 'package:foxbit_hiring_test_template/app/utils/base_cubit_state.dart';
import 'package:foxbit_hiring_test_template/app/widgets/loader.dart';
import 'package:foxbit_hiring_test_template/di.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_details_entity.dart';

class InstrumentItemDetails extends StatefulWidget {
  final int instrumentId;

  const InstrumentItemDetails({
    super.key,
    required this.instrumentId,
  });

  @override
  State<InstrumentItemDetails> createState() => _InstrumentItemDetailsState();
}

class _InstrumentItemDetailsState extends State<InstrumentItemDetails> {
  late final InstrumentItemCubit instrumentItemCubit;

  @override
  void initState() {
    super.initState();
    instrumentItemCubit = getIt<InstrumentItemCubit>()
      ..listenUpdates(widget.instrumentId);
  }

  @override
  void dispose() {
    instrumentItemCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstrumentItemCubit, BaseCubitState>(
      bloc: instrumentItemCubit,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            return const LoadingIndicator();
          case SuccessState():
            final instrument = state.data as InstrumentDetailsEntity;
            return InstrumentItemDetailsInfo(
              instrumentDetailsEntity: instrument,
            );
          case ErrorState():
            return Text(state.message);
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
