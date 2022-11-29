import 'package:flutter/services.dart';

import '../shared.dart';

///[Edittext]This is common class for edittext
class Edittext extends TextField {
  Edittext(
      {Key? key,
      TextEditingController? controller,
      TextCapitalization textCapitalization = TextCapitalization.none,
      double fontSize = 16,
      TextInputAction? textInputAction,
      TextInputType keyboardType = TextInputType.text,
      List<TextInputFormatter>? inputFormatter,
      int maxLength = TextField.noMaxLength,
      bool obscureText = false,
      double borderWidth = 0,
//      Color textColor: MyColors.colorTextGrey,
      // Color textColor: AppColors.defaultTextColor,
      Decoration? decoration,
      InputDecoration? inputDecoration,
      OutlinedBorder? outlinedBorder,
      Border? border,
      ShapeBorder? shapeBorder,
      String hint = '',
      bool enabled = true,
      Color fillColor = AppColors.white,
      Color disabledColor = Colors.transparent,
      int maxLine = 1,
      int minLine = 1,
      Color? hintColor,
      String fontFamily = 'Inter',
      TextAlign textAlign = TextAlign.left,
      double verticalPadding = 10,
      //    FontWeight fontWeight: FontWeight.w800,
      double borderRadius = 8,
      Function(String)? onchange,
      bool enableSuggestion = false,
      double horizontalPadding = 15,
      FocusNode? focusNode})
      : super(
          key: key,
          textCapitalization: textCapitalization,
          enabled: enabled,
          maxLength: maxLength,
          inputFormatters: inputFormatter,
          textAlign: textAlign,
          autocorrect: enableSuggestion,
          enableSuggestions: enableSuggestion,
          maxLines: maxLine,
          minLines: minLine,
          textAlignVertical: TextAlignVertical.bottom,
          controller: controller /*?? TextEditingController()*/,
          /*style: AppTheme
              .textFieldNormalStyle */ /*TextStyle(
              fontSize: fontSize.sp,
              color: textColor,
            */ /*    fontFamily: fontFamily,
              fontWeight: fontWeight*/ /*
          )*/

          keyboardType: keyboardType,
          textInputAction: textInputAction,
          focusNode: focusNode,
          onChanged: onchange,
          obscureText: obscureText,
          decoration: InputDecoration(
            /*   hintStyle: AppTheme.hintStyle,*/
            counterText: '',
            hintText: hint,
            counterStyle: const TextStyle(fontSize: 0),
            fillColor: fillColor,
            filled: true,
            contentPadding: EdgeInsets.only(
              top: verticalPadding + 0.2,
              bottom: verticalPadding,
              left: horizontalPadding,
              right: horizontalPadding,
            ),
            isDense: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.white, width: 1)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xffE3E5E6),
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xffE3E5E6),
                width: 1.0,
              ),
            ),
          ),
        );
}
