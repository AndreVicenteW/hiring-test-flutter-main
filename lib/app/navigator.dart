import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/app/pages/home/home_view.dart';
import 'package:foxbit_hiring_test_template/app/pages/quotation/quotation_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (BuildContext context) => const HomePage(),
  '/quotation': (BuildContext context) => const QuotationPage(),
};
