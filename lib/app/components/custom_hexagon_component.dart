import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/app/utils/color_manager.dart';
import 'package:football_app/app/utils/text_style_manager.dart';

class Hexagon extends StatelessWidget {
  final double screenWidth;
  const Hexagon({super.key, required this.screenWidth});


  double get diameter => screenWidth-100;
  double get radius => diameter/2;

  static const messi=[
    Rating("Heading", 55),
    Rating("Shooting", 85),
    Rating("Passing", 35),
    Rating("Dribbling", 90),
    Rating("Defence", 55),
    Rating("Physical", 70),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children:[
          Labels(radius:radius,diameter:diameter,rating:messi),
          CustomPaint(painter: HexagonPainter(radius:radius),),
          ClipPath(
            clipper: HexagonClipper(radius : radius,multipliers:[
              messi[0].value/100,
              messi[1].value/100,
              messi[2].value/100,
              messi[3].value/100,
              messi[4].value/100,
              messi[5].value/100,

            ]),
            child: SizedBox(
              width: diameter,
              height: diameter,
              child: ColoredBox(color: ColorManager.analyticColor.withOpacity(0.9)),
            ),
          )
    ]
        ) ;
  }
}

class HexagonClipper extends CustomClipper<Path>{
  final double radius;
  final List<double> multipliers;

  HexagonClipper({required this.radius,required this.multipliers});

  @override
  Path getClip(Size size) {

    final center=Offset(size.width/2, size.width/2);
    final Path path= Path();
    final angleMul=[1,3,5,7,9,11];
    
    path.addPolygon([

      for(int i=0;i<5;i++)
        Offset(
            radius * multipliers[i]*cos(pi * 2 * (angleMul[i]*30)/360) + center.dx,
            radius * multipliers[i]*sin(pi * 2 * (angleMul[i]*30)/360) + center.dy
        ),

      ],true
    );
     return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }
}

class Labels extends StatelessWidget {
  final double radius ,diameter;
  final List<Rating> rating;
  const Labels({super.key, required this.radius, required this.diameter, required this.rating});

  @override
  Widget build(BuildContext context) {
  final center =Offset(diameter/2 + 50, diameter/2 + 50);
  final style=TextStyleManager.standingTextStyle,
   textAlign=TextAlign.center;
    return Stack(
      children: [
        Positioned.fromRect(
            rect: Rect.fromCenter(
                center: Offset(
                  radius * cos(pi * 2 * 30/360)+center.dx + 30,
                  radius * sin(pi * 2 * 30/360)+center.dy,
                ),
                width: 100,
                height: 40),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(rating[0].name,style: style,textAlign: textAlign,),
                  //Text(rating[0].value.toString(),style: style,textAlign: textAlign,)
                ],
              ),
            )
        ),
        Positioned.fromRect(
            rect: Rect.fromCenter(
                center: Offset(
                  radius * cos(pi * 2 * 90/360)+center.dx,
                  radius * sin(pi * 2 * 90/360)+center.dy + 30,
                ),
                width: 100,
                height: 40),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(rating[1].name,style: style,textAlign: textAlign,),
                  //Text(rating[1].value.toString(),style: style,textAlign: textAlign,)
                ],
              ),
            )
        ),
        Positioned.fromRect(
            rect: Rect.fromCenter(
                center: Offset(
                  radius * cos(pi * 2 * 150/360)+center.dx - 30,
                  radius * sin(pi * 2 * 150/360)+center.dy,
                ),
                width: 100,
                height: 40),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(rating[2].name,style: style,textAlign: textAlign,),
                  //Text(rating[2].value.toString(),style: style,textAlign: textAlign,)
                ],
              ),
            )
        ),
        Positioned.fromRect(
            rect: Rect.fromCenter(
                center: Offset(
                  radius * cos(pi * 2 * 210/360)+center.dx - 30,
                  radius * sin(pi * 2 * 210/360)+center.dy ,
                ),
                width: 100,
                height: 40),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(rating[3].name,style: style,textAlign: textAlign,),
                  //Text(rating[3].value.toString(),style: style,textAlign: textAlign,)
                ],
              ),
            )
        ),
        Positioned.fromRect(
            rect: Rect.fromCenter(
                center: Offset(
                  radius * cos(pi * 2 * 270/360)+center.dx,
                  radius * sin(pi * 2 * 270/360)+center.dy - 30,
                ),
                width: 100,
                height: 40),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(rating[4].name,style: style,textAlign: textAlign,),
                  //Text(rating[4].value.toString(),style: style,textAlign: textAlign,)
                ],
              ),
            )
        ),
        Positioned.fromRect(
            rect: Rect.fromCenter(
                center: Offset(
                  radius * cos(pi * 2 * 330/360)+center.dx + 30,
                  radius * sin(pi * 2 * 330/360)+center.dy,
                ),
                width: 100,
                height: 40),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(rating[5].name,style: style,textAlign: textAlign,),
                  //Text(rating[5].value.toString(),style: style,textAlign: textAlign,)
                ],
              ),
            )
        )
      ],
    ) ;
  }
}

class HexagonPainter extends CustomPainter {


  final double radius;
  HexagonPainter({required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint borderPaint=Paint()
      ..strokeCap=StrokeCap.round
      ..style=PaintingStyle.stroke
      ..color=ColorManager.secondaryAppColor2
      ..strokeWidth=1.0;

    final center=Offset(size.width/2, size.width/2);
    final angleMul=[1,3,5,7,9,11,1];
    for(int j=0;j<=5;j++) {
      for (int i = 0; i < 6; i++) {
        canvas.drawLine(
            Offset(
                j/5 * radius * cos(pi * 2 * (angleMul[i] * 30 / 360)) + center.dx,
                j/5 * radius * sin(pi * 2 * (angleMul[i] * 30 / 360)) + center.dy
            ),
            Offset(
                j/5 * radius * cos(pi * 2 * (angleMul[i + 1] * 30 / 360)) + center.dx,
                j/5 * radius * sin(pi * 2 * (angleMul[i + 1] * 30 / 360)) + center.dy
            ),
            borderPaint
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Rating{


  final String name;
  final int value;
  const Rating(this.name,this.value);

}
