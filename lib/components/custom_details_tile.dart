import 'package:flutter/material.dart';
import 'package:marvel_catalog/components/custom_tile_text.dart';
import 'package:marvel_catalog/utilities/all_colors.dart';

import '../utilities/app_sizes.dart';

class CustomDetailsTile {
  static show(
      {required BuildContext context,
      required String title,
      required List<Widget> list}) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(title),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: AllColors.primaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          children: list.isEmpty
              ? [CustomTileText.show(context: context, text: "N/A")]
              : list,
        ),
        AppSizes.gapH10,
      ],
    );
  }
}
