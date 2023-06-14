import 'package:flutter/material.dart';
import 'package:marvel_catalog/network/constant/api_value.dart';
import 'package:marvel_catalog/utilities/all_colors.dart';
import 'package:marvel_catalog/utilities/all_texts.dart';
import 'package:marvel_catalog/utilities/app_sizes.dart';

class ErrorDialogue {
  static show({required BuildContext context}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withOpacity(0.5),
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: AllColors.primaryColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ApiValue.exceptionMessage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AppSizes.gapH10,
            Text(
              ApiValue.errorMessage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            AppSizes.gapH50,
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: AllColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              height: 35,
              child: Text(
                AllTexts.okay,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
