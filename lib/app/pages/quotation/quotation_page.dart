import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/cubits/quotation_cubit.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/widgets/instrument_list.dart';
import 'package:foxbit_hiring_test_template/app/utils/base_cubit_state.dart';
import 'package:foxbit_hiring_test_template/app/widgets/loader.dart';
import 'package:foxbit_hiring_test_template/di.dart';
import 'package:foxbit_hiring_test_template/domain/entities/instrument_entity.dart';

class QuotationPage extends StatefulWidget {
  const QuotationPage({super.key});

  @override
  State<QuotationPage> createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
  late final QuotationCubit quotationCubit;

  @override
  void initState() {
    super.initState();

    quotationCubit = getIt<QuotationCubit>()..getInstruments();
  }

  @override
  void dispose() {
    quotationCubit.closeConnection();
    quotationCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      appBar: AppBar(
        title: const Text(
          "Cotação",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<QuotationCubit, BaseCubitState>(
          bloc: quotationCubit,
          builder: (context, state) {
            switch (state) {
              case LoadingState():
                return const LoadingIndicator();
              case SuccessState():
                return InstrumentList(
                  instrumentList: state.data as List<InstrumentEntity>,
                );
              case ErrorState():
                return Text(state.message);
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
