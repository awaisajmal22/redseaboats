import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:redseaboats/Common/AppBar/custom_appbar_2.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

class BookingStarReviewView extends StatelessWidget {
   BookingStarReviewView({super.key});
final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(title: 'Write a Review'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 7.0),
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 8.5,
          ),
          appText(
            text: 'Add your review', fontSize: SizeConfig.textMultiplier * 3.8, textColor: AppColor.textBlack),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3.0,
            ),
            TextFormField(
              controller: controller,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: SizeConfig.textMultiplier * 2.0,
                  color: AppColor.textBlack,
                  fontWeight: FontWeight.w400
                ),
              cursorColor: AppColor.cursorColor,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Tell us about your experience',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: SizeConfig.textMultiplier * 2.0,
                  color: AppColor.textGrey,
                  fontWeight: FontWeight.w400
                ),
                focusColor: AppColor.white,
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(
                  color: AppColor.textGrey.withOpacity(0.3),
                  width: 1
                ))
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 7.0,
            ),
            Align(
              alignment: Alignment.center,
              child: RatingBar.builder(
                        itemSize: SizeConfig.imageSizeMultiplier * 12,
                        initialRating: 5,
                        minRating: 1,
                        maxRating: 5,
                        itemBuilder: (context, index) {
                          return Icon(Icons.star, color: Color(0xffFDB515));
                        },
                        onRatingUpdate:(value){}
                        ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 5.1,
            ),
            appButton(
              butonWidth: SizeConfig.widthMultiplier * 100,
              buttonHeight: SizeConfig.heightMultiplier * 6.8,
              voidCallback: (){}, widget: appText(text: 'Submit', fontSize: SizeConfig.textMultiplier * 2.0))
        ],
      ),
    );
  }
}