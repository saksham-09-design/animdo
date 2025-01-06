import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Homepage();
  }
}

class _Homepage extends State<Homepage> {
  _Homepage();
  late double _deviceHeight;
  double _buttonRadius = 100;
  final Tween<double> _backgroundCircle = Tween<double>(begin: 0.0, end: 0.3);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: _deviceHeight * .10,
        title: const Text(
          "Animdo",
          style: TextStyle(
              color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            _pageBackground(),
            Align(
              alignment: Alignment.center,
              child: _circularButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageBackground() {
    return TweenAnimationBuilder(
      tween: _backgroundCircle,
      duration: const Duration(seconds: 2),
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _circularButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _buttonRadius += _buttonRadius == 100 ? 100 : -100;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.bounceInOut,
        height: _buttonRadius,
        width: _buttonRadius,
        margin: const EdgeInsets.only(top: 50.0),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(_buttonRadius),
        ),
        child: const Center(
          child: Text(
            "Press Me!",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
