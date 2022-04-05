import 'package:flutter/material.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/widgets/scaffold/flat_app_scaffold.dart';

class StudentGamesScreen extends StatelessWidget {
  const StudentGamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatAppScaffold(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AssetsImage.gameLand),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 160.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: NetworkImage('https://image.winudf.com/v2/image1/Y29tLmFwcHRvaWRlLmtpZHMua2luZGVyZ2FydGVuZWR1Y2F0aW9uX3NjcmVlbl83XzE1NjA0NjI0NDhfMDgy/screen-7.jpg?fakeurl=1&type=.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),

              ),
            ],
          ),
        ),
    );
  }
}
