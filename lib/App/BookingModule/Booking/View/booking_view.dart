import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/BookingModule/Booking/ViewModel/booking_view_model.dart';
import 'package:redseaboats/App/HomeModule/Home/View/home_view.dart';
import 'package:redseaboats/Common/AppBar/custom_AppBar.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';
import 'package:redseaboats/RoutesAndBindings/app_routes.dart';

import '../../../HomeModule/Home/ViewModel/home_view_model.dart';
import 'Component/booking_tile.dart';

class BookingView extends StatelessWidget {
  BookingView({super.key});
  final bookingVM = Get.find<BookingViewModel>();
  final homeVM = Get.find<HomeViewModel>();
  final bookingNumber = 'RSB12345678';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 5.0),
            child: customAppBar(title: 'Current Location'),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 7,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 3,
                  width: SizeConfig.widthMultiplier * 100,
                  color: AppColor.textGrey.withOpacity(0.14),
                ),
                TabBar(
                    indicatorWeight: 3,
                    indicatorColor: AppColor.parrotGreen,
                    labelColor: AppColor.parrotGreen,
                    unselectedLabelColor: AppColor.textBlack,
                    unselectedLabelStyle: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 1.8,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                    labelStyle: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 1.8,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                    controller: bookingVM.tabController,
                    tabs: bookingVM.myTabs),
              ],
            ),
          ),
          Container(
            color: AppColor.white,
            height: SizeConfig.heightMultiplier * 70.64,
            child: TabBarView(controller: bookingVM.tabController, children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 67.64,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return bookingTile(
                          voidCallback: () {
                            Get.toNamed(AppRoutes.bookingDetailView,);
                          },
                          onratingupdate: (value) {},
                          title: 'Dhow Curise',
                          date: '16, October 2022',
                          imageUrl:
                              'https://images.unsplash.com/photo-1679098958588-e48f645c6492?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                          locationName: 'Dubai Water Sports',
                          personQuantity: '4',
                          price: '450',
                          ticketNumber: bookingNumber,
                          timing: '5:00 PM to 6:00 PM',
                          initialRating: 3.0,
                          totalRating: '456');
                    }),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 67.64,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return bookingTile(
                          voidCallback: () {
                            Get.toNamed(
                              AppRoutes.bookingDetailView, );
                          },
                          onratingupdate: (value) {},
                          title: 'Dhow Curise',
                          date: '16, October 2022',
                          imageUrl:
                              'https://images.unsplash.com/photo-1679098958588-e48f645c6492?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                          locationName: 'Dubai Water Sports',
                          personQuantity: '4',
                          price: '450',
                          ticketNumber: bookingNumber,
                          timing: '5:00 PM to 6:00 PM',
                          initialRating: 3.0,
                          totalRating: '456');
                    }),
              ),
            ]),
          )
        ],
      )),
    );
  }
}
