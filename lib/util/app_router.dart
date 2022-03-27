import 'package:auto_route/auto_route.dart';

import '../pages/home_page.dart';
import '../pages/transaction_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true, name: 'HomeRoute', path: '/'),
    AutoRoute(
        page: TransactionPage, name: 'TransactionRoute', path: '/transaction'),
  ],
)
class $AppRouter {}
