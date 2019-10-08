import 'package:meta/meta.dart';

@immutable
class CounterState {
  int _count;
  get count => _count;

  CounterState(this._count);
}