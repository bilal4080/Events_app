// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:organizer/utils/color.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final Function(String?)? onSave;
  final int? maxLines;
  final bool isPassword;
  final bool enable;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? check;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;
  final String? compalsery;
  final String? hint;
  final Color? hintColor;
  final int? maxlength;
  final String? initialValue;
  final bool readOnly;
  final Function()? ontap;
  final TextAlign textAlign;
  final bool isfilled;
  final Color? filledcolor;
  const CustomTextField({
    Key? key,
    this.hintText,
    this.textInputAction,
    this.check,
    this.compalsery,
    this.hintColor= Colors.red,
    this.controller,
    this.validate,
    this.onSave,
    this.maxLines,
    this.isPassword=false,
    this.enable=true,
     this.keyboardType,
    this.focusNode,
    this.prefix,
    this.hint,
    this.maxlength,
    this.suffix,
    this.initialValue,
   required this.readOnly,
   this.filledcolor,
   required this.isfilled,
   this.ontap,
  required this.textAlign

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ,
      onTap: ontap,
      readOnly:readOnly ,
      initialValue: initialValue,
      maxLength: maxlength,
      maxLines: maxLines==null?1:maxLines,
      onSaved: onSave,
      focusNode: focusNode,
      enabled: enable==true?true:enable,
      textInputAction: textInputAction,
      obscureText: isPassword==false?false:isPassword,
      validator: validate,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: isfilled ,
        fillColor: filledcolor,
        hintStyle: TextStyle(color: greyColor),
        hintText: hint,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          Text(hintText==null?"":hintText.toString()),
          Text(compalsery??"",style: TextStyle(color: hintColor,fontSize: 20))
        ],),
        prefix: prefix,
        suffix: suffix,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
             width: 1
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide:  BorderSide(
            color:Theme.of(context).primaryColor,
             width: 1
          ),
        ),
        
        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: Colors.red,
             width: 1
          ),
        ),
         focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide:  BorderSide(
            color: Theme.of(context).primaryColor,
             width: 1
          ),
        )
      ),
    );
  }
}
