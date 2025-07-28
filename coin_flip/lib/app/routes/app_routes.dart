part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const STATS = _Paths.STATS;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const STATS = '/stats';
}
