import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/landing/business_logic_layer/landing_provider_container.dart';
import 'package:selaheltelmeez/features/landing/data_access_layer/data_transfer_object/landing_section.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<ValueCommitResult<LandingSection>> result =
        ref.watch(LandingProviderContainer.futureLandingProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: result.when(
        loading: () => const Center(
            child: CircularProgressIndicator(
          color: Colors.black,
        )),
        error: (err, stack) => Text('Error: $err'),
        data: (result)=> Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage(AssetsImage.landing)),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("تعرف على منهجك الدراسي بطريقة سهلة وأكثر تفاعلية", style: GoogleFonts.cairo(color: Colors.black),),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 180.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: result.value.listSection?[0].listItem?.length,
                    itemBuilder: (BuildContext context, int index) =>
                        Card(child: Image(image: NetworkImage(result.value.listSection?[0].listItem?[index].thumbnail ?? ""),),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("تعرف على مايقدمه التطبيق وأهم مميزاته", style: GoogleFonts.cairo(color: Colors.black),),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 95.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: result.value.listSection?[1].listItem?.length,
                    itemBuilder: (BuildContext context, int index) =>
                        Card(child: Image(image: NetworkImage(result.value.listSection?[1].listItem?[index].thumbnail ?? ""),),
                        ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("قريبا Joy School", style: GoogleFonts.cairo(color: Colors.black),),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Image(image: AssetImage(AssetsImage.joySchool)),
              ),
            ],
          )
      ),
    );
  }
}
