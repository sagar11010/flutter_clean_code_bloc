import 'package:clean_code_structure/shared/shared.dart';

///[TextView]  is common text class
class TextView extends StatelessWidget {
 const TextView(
      {Key? key,
      this.text,
      this.fontSize= 15,
/*
      this.fontFamily: FontFamily.inter,
      this.textColor: AppColors.black,
*/
      this.fontWeight= FontWeight.w500,
      this.marginTop= 0,
      this.maxLine,
      this.textOverflow,
      this.lineheight,
      this.textAlign,
      this.textDecoration,
      this.laterSpacing, this.fontFamily, this.textColor})
      : assert(text != null),
        super(key: key);

  final TextDecoration? textDecoration;
  final int? fontSize;
  final String? text;
  final String? fontFamily;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? marginTop;
  final int? maxLine;
  final TextOverflow? textOverflow;
  final double? lineheight;
  final TextAlign? textAlign;
  final double? laterSpacing;

  @override
  Widget build(BuildContext context) {
/*    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);*/

    return Container(
      margin: EdgeInsets.only(top: marginTop ?? 0),
      child: Text(
        text ?? '',
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLine,
        style: TextStyle(letterSpacing: laterSpacing,
          decoration: textDecoration,
          height: lineheight,
          fontSize: fontSize!.sp /*ScreenUtil().setSp(fontSize! * 2)*/,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}
