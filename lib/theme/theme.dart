import 'package:flutter/material.dart';

double respWidth = 0.0;
double respHeight = 0.0;

// BorderRadius

BorderRadius bRadius = BorderRadius.circular(2.0);
BorderRadius bRadiusCTA = BorderRadius.circular(4.0);
BorderRadius bRadiusJudge = BorderRadius.circular(300.0);
BorderRadius bRadiusCard = BorderRadius.circular(11.0);


// Colors

Color backgroundColor = const Color(0xFFF9F9F9);
Color primaryColor = const Color(0xFFEBEBEB);
Color secondaryColor = const Color(0xFF848484);
Color accentColor = const Color(0xFFFFFFFF);
Color blueColor = const Color(0xFFA2C0D1);
Color greenColor = const Color(0xFFA5D79D);
Color redColor = const Color(0xFFD77777);


// TextStyle

TextStyle textStyleContent = const TextStyle(
  // fontFamily: 'OpenSans',
  fontFamily: 'Montserrat',
  fontSize: 12,
  color: Color(0xFF494949),
);
TextStyle textNewsTitle = const TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w700,
  fontSize: 20,
  color: Color(0xFF282828),
);
TextStyle textNewsContent = const TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  fontSize: 12,
  letterSpacing: 1.2,
  color: Color(0xFF393939),
);
TextStyle textTotal = const TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  fontSize: 12,
  color: Color(0xFFD77777),
);
TextStyle textCommentProfile = const TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  fontSize: 12,
  color: Color(0xFF7E7E7E),
);
TextStyle textCard = const TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  fontSize: 12,
  color: Color(0xFF282828),
);
TextStyle textJudgementContent = const TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  fontSize: 10,
  color: Color(0xFF393939),
);
TextStyle textAuthInputLabel = const TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: Color.fromARGB(255, 104, 104, 104),
);
TextStyle textAuthButton = const TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w700,
  fontSize: 18,
  color: Color.fromARGB(255, 255, 255, 255),
);
TextStyle textStyleColoredButton = const TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: Color.fromARGB(255, 255, 255, 255),
);

class CtaButton extends StatelessWidget {
  const CtaButton({ Key? key, required this.content, this.onPressed}) : super(key: key);

  final String content;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox
    (
      width: respWidth * 0.5,
      height: 35,
      child: TextButton
      (
        style: ButtonStyle( elevation: MaterialStateProperty.all(6.0),padding: MaterialStateProperty.all(EdgeInsets.zero), backgroundColor: MaterialStateProperty.all(accentColor), shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: bRadiusCTA))),
        onPressed: onPressed,
        child: Center(child: Text(content, style: textStyleContent)),
      )
    );   
  }
}

class CtaButtonLogin extends StatelessWidget {
  const CtaButtonLogin({ Key? key, required this.content, this.onPressed}) : super(key: key);

  final String content;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox
    (
      width: respWidth * 0.8,
      height: 35,
      child: TextButton
      (
        style: ButtonStyle( elevation: MaterialStateProperty.all(6.0),padding: MaterialStateProperty.all(EdgeInsets.zero), backgroundColor: MaterialStateProperty.all(blueColor), shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: bRadiusCTA))),
        onPressed: onPressed,
        child: Center(child: Text(content, style: textStyleColoredButton)),
      )
    );   
  }
}

class JudgeButton extends StatelessWidget {
  const JudgeButton({ Key? key,this.onPressed}) : super(key: key);
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox
    (
      width: respWidth * 0.8,
      height: 45,
      child: TextButton
      (
        style: ButtonStyle( elevation: MaterialStateProperty.all(6.0),padding: MaterialStateProperty.all(EdgeInsets.zero), backgroundColor: MaterialStateProperty.all(blueColor), shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: bRadiusJudge))),
        onPressed: onPressed,
        child: Center(child: Text("Juger", style: textStyleColoredButton)),
      )
    );   
  }
}

class YesButton extends StatelessWidget {
  const YesButton({ Key? key,this.onPressed}) : super(key: key);
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox
    (
      width: 45,
      height: 45,
      child: TextButton
      (
        style: ButtonStyle( elevation: MaterialStateProperty.all(6.0),padding: MaterialStateProperty.all(EdgeInsets.zero), backgroundColor: MaterialStateProperty.all(greenColor), shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: bRadiusJudge))),
        onPressed: onPressed,
        child: Center(child: Icon(Icons.radio_button_checked)),
      )
    );   
  }
}

class NoButton extends StatelessWidget {
  const NoButton({ Key? key,this.onPressed}) : super(key: key);
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox
    (
      width: 45,
      height: 45,
      child: TextButton
      (
        style: ButtonStyle( elevation: MaterialStateProperty.all(6.0),padding: MaterialStateProperty.all(EdgeInsets.zero), backgroundColor: MaterialStateProperty.all(redColor), shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: bRadiusJudge))),
        onPressed: onPressed,
        child: Center(child: Icon(Icons.radio_button_unchecked)),
      )
    );   
  }
}

Widget voteBar(int up, int down) {
  
  double vote = 0;
  if (up != 0)
    {
      vote = down/up;
    }

  return Stack
  (
    children: 
    [
      Container
      (
        width: respWidth * 0.8,
        height: 12,
        decoration: BoxDecoration
        (
          borderRadius: BorderRadius.circular(4.0),
          color: greenColor,
        ),
      ),
      Container
      (
        width: respWidth * 0.8 * vote,
        height: 12,
        decoration: BoxDecoration
        (
          borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0), bottomLeft: Radius.circular(4.0)),
          color: redColor,
        ),
      ),
    ],
  );
}
