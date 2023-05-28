import 'package:flutter/material.dart';


import '../../../config/colorz.dart';
import '../../../config/dimens.dart';
import '../../../config/thems.dart';

class CustomWidget extends StatelessWidget {
  final String title;

  const CustomWidget({
    super.key,
    required this.title,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Margins.tiny),
      child: SizedBox(
        child: Container(
            decoration: BoxDecoration(
              color: Colorz.colorForRowWidget,
              borderRadius: BorderRadius.circular(BorderRadiuses.gigantic),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: Margins.medium, right: Margins.medium),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(title, style: CustomTheme.textStyleTextBig),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
