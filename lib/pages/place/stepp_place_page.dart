import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stepp_app/constants/place/stepp_place_size.dart';
import 'package:stepp_app/data_models/stepp_place/stepp_place_model.dart';
import 'package:stepp_app/utils/build_context_helper.dart';
import 'package:stepp_app/widgets/place/stepp_place_widget.dart';

class SteppPlace extends StatefulWidget {
  const SteppPlace({super.key});

  @override
  State<SteppPlace> createState() => _SteppPlaceState();
}

class _SteppPlaceState extends State<SteppPlace> with TickerProviderStateMixin {
  final mockSteppPlace = SteppPlaceModel.mockSteppPlace;
  int _currentPage = 0;
  late PageController _pageController;
  late Timer _timer;
  double _progressValue = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: SteppPlaceSize.steppPlaceInitialPage,
      viewportFraction: SteppPlaceSize.steppPlaceViewPortFraction,
    );
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(
        const Duration(seconds: SteppPlaceSize.tweenLinearAnimDuration),
        (timer) {
      setState(() {
        _progressValue += 1 / 8;
        if (_progressValue >= 1.0) {
          _progressValue = 0;
          _currentPage = (_currentPage + 1) % mockSteppPlace.length;
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: mockSteppPlace.length,
            itemBuilder: (context, index) {
              return SteppPlaceWidget(
                steppPlace: mockSteppPlace[index],
              );
            },
            onPageChanged: (index) {
              setState(() {
                _progressValue = 0;
                _currentPage = index;
              });
            },
          ),
          Positioned(
            bottom: 30.0,
            child: SizedBox(
              width: context.deviceSize.width,
              child: TweenAnimationBuilder(
                tween: Tween(
                  begin: SteppPlaceSize.tweenBegin,
                  end: _progressValue,
                ),
                duration: const Duration(
                  seconds: SteppPlaceSize.tweenLinearAnimDuration,
                ),
                builder: (context, value, child) {
                  return SizedBox(
                    width: 300,
                    child: LinearProgressIndicator(
                      value: value,
                      minHeight: SteppPlaceSize.linearIndicatorMinHeight,
                      backgroundColor: Colors.transparent,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
