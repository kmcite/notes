import 'package:alien_signals/alien_signals.dart';

enum ViewMode { list, grid }

final viewModeSignal = signal(ViewMode.grid);
void onViewModeChanged(ViewMode mode) {
  viewModeSignal.set(mode);
}
