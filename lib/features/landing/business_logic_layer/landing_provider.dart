import 'package:flutter_riverpod/flutter_riverpod.dart';

final landingProvider = StateNotifierProvider((ref) {
  return LandingState();
});

class LandingState extends StateNotifier<int> {
  LandingState(): super(0);

  void increment() => state++;
}
