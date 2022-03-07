import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/landing/data_access_layer/data_transfer_object/landing_section.dart';
import 'package:selaheltelmeez/features/landing/data_access_layer/repository/landing_repository.dart';

class LandingProviderContainer {

  static final futureLandingProvider = FutureProvider<ValueCommitResult<LandingSection>>((ref) async => await LandingRepository().getLandingSectionsAsync());
}
