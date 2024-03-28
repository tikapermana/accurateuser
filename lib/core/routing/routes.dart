part of 'pages.dart';

abstract class PageRoutes {
  PageRoutes._();
  static const account = _Paths.account;
  static const dashboard = _Paths.dashboard;
  static const exception = _Paths.exception;
}

abstract class _Paths {
  static const account = '/account';
  static const exception = '/exception';
  static const dashboard = '/dashboard';
}
