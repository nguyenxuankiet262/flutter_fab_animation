import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math.dart' as vector;

const int _timeRotate = 500;
const int _timeScale = 500;
const int _timeOpacity = 250;

class FabCircularMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> options;
  final Color ringColor;
  final double ringDiameter;
  final double ringWidth;
  final EdgeInsets fabMargin;
  final Color fabColor;
  final Icon fabOpenIcon;
  final Icon fabCloseIcon;
  final Duration animationDuration;

  FabCircularMenu(
      {@required this.child,
      @required this.options,
      this.ringColor = Colors.white,
      this.ringDiameter,
      this.ringWidth,
      this.fabMargin = const EdgeInsets.all(24.0),
      this.fabColor,
      this.fabOpenIcon = const Icon(Icons.menu),
      this.fabCloseIcon = const Icon(Icons.close),
      this.animationDuration = const Duration(milliseconds: _timeScale)});

  @override
  _FabCircularMenuState createState() => _FabCircularMenuState();
}

class _FabCircularMenuState extends State<FabCircularMenu>
    with TickerProviderStateMixin {
  AnimationController _rotateController;
  double ringDiameter;
  double ringWidth;
  Color fabColor;

  bool animating = false;
  bool open = false;
  AnimationController controller;
  AnimationController bounceController;
  Animation<double> scaleAnimation;
  Animation scaleCurve;
  Animation<double> rotateAnimation;
  Animation rotateCurve;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _rotateController = AnimationController(
      duration: Duration(milliseconds: _timeRotate),
      vsync: this,
    );
    bounceController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    bounceController.addListener(() {
      setState(() {});
    });
    bounceController.forward();
    bounceController.repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ringDiameter =
        widget.ringDiameter ?? 300;
    ringWidth = widget.ringWidth ?? ringDiameter / 3;
    fabColor = widget.fabColor ?? Theme.of(context).primaryColor;

    controller =
        AnimationController(duration: widget.animationDuration, vsync: this);

    scaleCurve = CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.4, curve: Curves.easeInOutCirc));
    scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(scaleCurve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    bounceController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double right = -(scaleAnimation.value * ringDiameter / 2 -
        40.0 -
        (widget.fabMargin.right / 2));
    double scale = 1 - bounceController.value;
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        widget.child,
        Positioned(
          right: right,
          child: AnimatedBuilder(
            animation: _rotateController,
            builder: (BuildContext context, Widget _widget) {
              return Transform.rotate(
                  angle: _rotateController.value * 6.3,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: scaleAnimation.value * ringDiameter,
                        height: scaleAnimation.value * ringDiameter,
                        child: CustomPaint(
                          foregroundPainter: _RingPainter(
                              ringColor: widget.ringColor,
                              ringWidth: scaleAnimation.value * ringWidth),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: ringDiameter / 2 - 15,
                        child: AnimatedOpacity(
                          opacity: open ? 1 : 0,
                          duration: Duration(milliseconds: _timeOpacity),
                          //Scale Animation
                          child: widget.options[0],
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        left: ringWidth - 40,
                        child: AnimatedOpacity(
                            opacity: open ? 1 : 0,
                            duration: Duration(milliseconds: _timeOpacity),
                            //Scale Animation
                            child: widget.options[1]),
                      ),
                      Positioned(
                        bottom: ringDiameter / 2 - 30,
                        left: 15,
                        child: AnimatedOpacity(
                            opacity: open ? 1 : 0,
                            duration: Duration(milliseconds: _timeOpacity),
                            //Scale Animation
                            child: widget.options[2]),
                      ),
                      Positioned(
                        top: 55,
                        left: ringWidth - 43,
                        child: AnimatedOpacity(
                            opacity: open ? 1 : 0,
                            duration: Duration(milliseconds: _timeOpacity),
                            //Scale Animation
                            child: widget.options[3]),
                      ),
                      Positioned(
                        top: 20,
                        left: ringDiameter / 2 - 15,
                        child: AnimatedOpacity(
                            opacity: open ? 1 : 0,
                            duration: Duration(milliseconds: _timeOpacity),
                            //Scale Animation
                            child: widget.options[4]),
                      ),
                    ],
                  ));
            },
          ),
        ),
        AnimatedPadding(
          padding: (animating || open) ? widget.fabMargin : !animating ? EdgeInsets.all(0.0) : widget.fabMargin,
          duration: Duration(milliseconds: 800),
          child: Transform.scale(
            scale: scale,
            child: FloatingActionButton(
                child: open ? widget.fabCloseIcon : widget.fabOpenIcon,
                backgroundColor: fabColor,
                onPressed: () {
                  if (!animating && !open) {
                    bounceController.stop();
                    animating = true;
                    _rotateController.forward();
                    open = true;
                    controller.forward().then((_) {
                      animating = false;
                    });
                  } else if (!animating) {
                    bounceController.forward();
                    bounceController.repeat();
                    _rotateController.reverse();
                    Future.delayed(Duration(milliseconds: _timeOpacity),(){
                      _rotateController.stop();
                    });
                    animating = true;
                    open = false;
                    controller.reverse().then((_) {
                      animating = false;
                    });
                  }
                }),
          )
        )
      ],
    );
  }
}

class _RingPainter extends CustomPainter {
  final Color ringColor;
  final double ringWidth;

  _RingPainter({@required this.ringColor, @required this.ringWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ringColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = ringWidth;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
