import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/ChatModule/WholeChat/ViewModel/chat_view_model.dart';
import 'package:redseaboats/Common/AppBar/custom_AppBar.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import '../../../../RoutesAndBindings/app_routes.dart';
import 'Component/chat_search_tile.dart';
import 'Component/floating_chat_button.dart';
import 'Component/user_chat_tile.dart';

class ChatView extends StatelessWidget {
   ChatView({super.key});
   final chatVM = Get.find<ChatViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: AppColor.greyWhite,
      body: SafeArea(
        child: Column(
          children: [
             Padding(
               padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
               child: customAppBar(title: 'Current Location'),
             ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.9,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0, ),
              child: chatSearchTile(
                controller: chatVM.chatSearchController
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.7,
            ),
            Expanded(
              child: SizedBox(
                height: SizeConfig.heightMultiplier * 68.63,
                
                child: ListView.builder(
                  itemCount: 5,
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5.0),
                  itemBuilder: (context, index) {
                return userChatTile(
                  voidCallback: (){
                    
                    Get.toNamed(AppRoutes.singleUserChatView);
                  },
                  index: index,
                  userImage: 'https://cdn.pixabay.com/photo/2016/04/20/19/47/wolves-1341881__340.jpg',
                  userName: 'Water Activities',
                  msg: 'I would love to take this trip with I would love to take this trip with ...',
                  time: '9:00AM',
                  textCount: '10'
                );
              },)),
            )
          ],
        ),
      ),
      floatingActionButton: floatingChatButton(
        voidCallBack: (){}
      ),
    );
  }
}