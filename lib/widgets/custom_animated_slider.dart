import 'package:flutter/material.dart';



class CustomAnimatedSlider extends StatefulWidget {

  final double height;
  final double width;
  
  const CustomAnimatedSlider({
    super.key,
    required this.height,
    required this.width
  });

  @override
  State<CustomAnimatedSlider> createState() => _CustomAnimatedSliderState();
}

class _CustomAnimatedSliderState extends State<CustomAnimatedSlider> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;
  late final Animation<double> _animator;

  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    _animator = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(animationListener);

    _controller.repeat();
  }


  void animationListener(){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    final double contHeight = widget.height;
    final double contWidth = widget.width;

    final double contExtraHeight = widget.height * 0.5;

    BoxDecoration dotDecoration = BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.black)
    );
    
    return SizedBox(
      height: contHeight,
      width: contWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [

          // Slider line
          Container(
            height: contHeight * 0.02,
            width: contWidth,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),

          // Slider dot

          GestureDetector(
            onTap: () {
              setState(() {
                isPressed = !isPressed;

                isPressed ? _controller.forward() : _controller.reverse();
              });
            },
            child: Container(
              height: (contHeight * 0.4) + (contExtraHeight * _animator.value),
              width: contWidth * 0.1,
              decoration: !isPressed 
                            ? dotDecoration 
                            : dotDecoration.copyWith(
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle
                              )
            ),
          ),
        ],
      ),
    );
  }
}