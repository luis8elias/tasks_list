import 'package:flutter/material.dart';

import '/config/size_constants.dart';


class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.isCheked,
    this.onChanged,
    this.readonly = false
  });

  final bool isCheked;
  final void Function(bool value)? onChanged;
  final bool readonly;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {

  late bool value;

 @override
  void initState() {
    value = widget.isCheked;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(kBorderRadius),
      onTap: widget.readonly ? null : (){
        setState(() {
          value = !value;
        });
        if(widget.onChanged != null){
          widget.onChanged!(value);
        }
        
      },
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: CircleAvatar(
          radius: 12,
          backgroundColor: value
          ? Theme.of(context).primaryColor
          : Theme.of(context).hintColor,
          child: value
          ? Icon(
            Icons.check,
            size: 15,
            color: Theme.of(context).primaryColorLight,
          )
          : const SizedBox.shrink(),
        ),
      ),
    );
  }
}