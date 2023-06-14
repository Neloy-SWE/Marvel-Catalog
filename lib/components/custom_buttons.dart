import 'package:flutter/material.dart';
import 'package:marvel_catalog/utilities/all_colors.dart';

class AllButtons {
  static btnGeneral({
    required BuildContext context,
    required String btnText,
    required Function() onTap,
  }) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: MaterialButton(
        onPressed: onTap,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
          ),
        ),
        color: AllColors.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Text(
              btnText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(
              flex: 1,
            ),
            const Icon(
              Icons.arrow_circle_right,
              size: 50,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  static btnDialogue({
    required BuildContext context,
    required String btnText,
    required Function() onTap,
  }) {
    return MaterialButton(
      onPressed: onTap,
      height: 40,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: AllColors.primaryColor,
      child: Text(
        btnText,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
