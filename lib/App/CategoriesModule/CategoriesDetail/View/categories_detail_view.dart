import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/CategoriesModule/Categories/View/Component/categories_tile.dart';
import 'package:redseaboats/App/CategoriesModule/CategoriesDetail/ViewModel/categories_detail_view_model.dart';
import 'package:redseaboats/Common/AppButton/app_button.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/Seprator/my_seperator.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../RoutesAndBindings/app_routes.dart';
import '../../../BookingModule/BookingDetail/View/Component/anemities_tile.dart';
import 'Component/background_image_tile.dart';
import 'Component/expection_tile.dart';
import 'Component/ticket_detail-tile.dart';

class CategoriesDetailView extends StatelessWidget {
  CategoriesDetailView({super.key});
  var data = Get.arguments[0];
  var slotData = Get.arguments[1];
  var modelList = Get.arguments[2];
  final categoriesDetailVM = Get.find<CategoriesDetailViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2.0, horizontal:  SizeConfig.widthMultiplier * 6.0),
        alignment: Alignment.center,
        height: SizeConfig.heightMultiplier * 10,
        color: AppColor.white,
        child: appButton(
          butonWidth: SizeConfig.widthMultiplier * 100,
          buttonHeight: SizeConfig.heightMultiplier * 6.8,
          voidCallback: (){},
           widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: const AssetImage('assets/category/paperplane.png'), height: SizeConfig.heightMultiplier * 3.0,
              width: SizeConfig.widthMultiplier * 6.0,),
              SizedBox(
                width: SizeConfig.widthMultiplier * 3.2,
              ),
              appText(text: 'Book Now', fontSize: SizeConfig.textMultiplier * 2.0)
            ],
          )),
      ),
        body: ListView(
          controller: categoriesDetailVM.controller,
      padding: const EdgeInsets.only(top: 0),
      children: [
        SizedBox(
          height: SizeConfig.heightMultiplier * 90,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child:  backgroundImageTile(
                      imageUrl: data.photoUrl,
                      isFavorite: data.isLiked,
                      favoriteCallback: () {
                        data.isLiked = !data.isLiked;
                      }),
              ),
              ticketDetailTile(
                totalLikes: data.likes[0],
                rating: data.rating.toString(),
                locationtitle: data.location.title,
                amenitiesList: data.amenities,
                selectedDurationIndex: categoriesDetailVM.selectedDurationIndex,
                noOfPerson: '4',
                itemCount: '02',
                title: data.title,
                price: slotData.price.toString(),
                initialRating: data.rating.toDouble(),
                ratingCallback: (value) {},
                totalRating: data.totalRating.toString(),
                decreamentCallback: () {
                },
                itemDetailCallBack: () {
                  print('object');
                  Get.toNamed(AppRoutes.categoryItemDetailView, arguments: [
                    data,
                    modelList
                  ]);
                },
                increamentCallback: () {},
                moreServicesCallBack: () {
                  categoriesDetailVM.scrollDown();
                },
                durationList: categoriesDetailVM.durationList,
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 3.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText(
                  text: 'Details',
                  fontSize: SizeConfig.textMultiplier * 2.25,
                  textColor: AppColor.textBlack),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.0,
              ),
              appText(
                  maxLines: 100,
                  textAlign: TextAlign.left,
                  text:
                      'Bali is an Indonesian island known for its forested volcanic mountains, iconic rice paddies, beaches and coral reefs. The island is home to religious sites such as cliffside Uluwatu Temple.',
                  fontSize: SizeConfig.textMultiplier * 1.6,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textGrey),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3.0,
              ),
              appText(
                  text: 'Gallery',
                  fontSize: SizeConfig.textMultiplier * 2.25,
                  textColor: AppColor.textBlack),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2.0,
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 17.4,
          child: ListView.builder(
              padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
              itemCount: data.galleryPhotoUrls.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      EdgeInsets.only(right: SizeConfig.widthMultiplier * 5.0),
                  height: SizeConfig.heightMultiplier * 17.4,
                  width: SizeConfig.widthMultiplier * 34.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              data.galleryPhotoUrls[index]),
                          fit: BoxFit.cover)),
                );
              }),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 3.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText(
                  text: 'What to Expect',
                  fontSize: SizeConfig.textMultiplier * 2.25,
                  textColor: AppColor.textBlack),
              SizedBox(
                height: SizeConfig.heightMultiplier * 1.5,
              ),
              Column(
                children: List.generate(
                    categoriesDetailVM.expactList.length,
                    (index) => expectionTile(
                      check: categoriesDetailVM.expactList[index].check,
                      title: categoriesDetailVM.expactList[index].title
                    )),
              ),
SizedBox(
  height: SizeConfig.heightMultiplier * 3.0,
),
appText(
                  text: 'Cancellation Policy',
                  fontSize: SizeConfig.textMultiplier * 2.25,
                  textColor: AppColor.textBlack),
                   SizedBox(
                height: SizeConfig.heightMultiplier * 2.0,
              ),
              appText(
                  maxLines: 100,
                  textAlign: TextAlign.left,
                  text:
                      'Bali is an Indonesian island known for its forested volcanic mountains, iconic rice paddies, beaches and coral reefs. The island is home to religious sites such as cliffside Uluwatu Temple.',
                  fontSize: SizeConfig.textMultiplier * 1.6,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textGrey),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3.0,
                  ),
                  appText(
                  text: 'More Sellers for this',
                  fontSize: SizeConfig.textMultiplier * 2.25,
                  textColor: AppColor.textBlack),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2.0,
                  ),
                  
            ],
          ),
        ),
        SizedBox(
                    height: SizeConfig.heightMultiplier * 22,
                   child: ListView.builder(
                    padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: modelList.length,
                    itemBuilder: (context, index){
                      var dataofModelList = modelList[index];
                      for(int i=0; i<dataofModelList.slots.length; i++) {
                        return Container(
                      margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 5.0),
                      child: categoriesTile(isFavoriteCallback: (){}, 
                      isFavorite:dataofModelList.isLiked,discount: dataofModelList.slots[i].discount.discountPercentage.toString(), ratingCallback: (value){}, initialRating: 3, title:dataofModelList.title, subtitle:dataofModelList.location.title, location:dataofModelList.location.streetAddress, price: dataofModelList.slots[i].price.toString(), imageUrl:dataofModelList.photoUrl, categoriesCallback: (){}),
                    );
                      }
                   }),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 12.0,
                  )
      ],
    ),
    floatingActionButton: GestureDetector(
      onTap: (){},
      child: Padding(
        padding:  EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 5.0),
        child: Image(image: const AssetImage('assets/category/chatbutton.png'), fit: BoxFit.cover, height: SizeConfig.heightMultiplier * 10,
          width: SizeConfig.widthMultiplier * 13.8,),
      )
        
    ),
    );
  }

  
}
