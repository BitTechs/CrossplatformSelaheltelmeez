import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:sizer/sizer.dart';

class AddChildScreen extends StatelessWidget {
  const AddChildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
              Stack(
                children: [
                  Image(
                    height: 30.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    image: const AssetImage(AssetsImage.parentHeader),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                ],
              ),

            SizedBox(height: 10.w,),

      InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(RouteNames.searchForChild);
        },
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              height: 8.h,
              width: 60.w,
              child: SvgPicture.asset(
                AssetsImage.inputBackground,
                color: CommonColors.inputBackgroundColor,
                fit: BoxFit.fill,
              ),
            ),
            Text('لديه حساب',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
            ),
          ],
        ),
      ),
            SizedBox(height: 10.w,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(RouteNames.registerChild);
              },
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 8.h,
                    width: 60.w,
                    child: SvgPicture.asset(
                      AssetsImage.inputBackground,
                      color: CommonColors.inputBackgroundColor,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text('انشاء حساب',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
