import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selaheltelmeez/features/authentication/login/business_logic_layer/login_request_state.dart';

class LoginProviderContainer {
  static final futureLoginProvider = StateNotifierProvider((ref) {
    return LoginRequestState();
  });
}

