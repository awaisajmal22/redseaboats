import 'package:flutter/cupertino.dart';

import '../../../../../../Common/AppColors/app_colors.dart';
import '../../../../../../Common/AppText/appText.dart';

Widget titleTile({
    required String title
  }) {
    return Align(
      alignment: Alignment.topLeft,
      child: appText(text: title, textColor: AppColor.textBlack));
  }