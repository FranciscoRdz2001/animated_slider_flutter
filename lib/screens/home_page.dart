import 'package:animated_slider_flutter/utils/responsive_util.dart';
import 'package:animated_slider_flutter/widgets/custom_animated_slider.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Animated Slider', style: TextStyle(fontSize: 30)),
            SizedBox(height: resp.hp(5)),
            CustomAnimatedSlider(
              height: resp.hp(15), 
              width: resp.wp(80)
            )
          ],
        ),
      ),
    );
  }
}