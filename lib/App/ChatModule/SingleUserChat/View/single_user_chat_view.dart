import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:redseaboats/App/ChatModule/SingleUserChat/Model/single_chat_model.dart';
import 'package:redseaboats/App/ChatModule/SingleUserChat/ViewModel/single_user_chat_view_model.dart';
import 'package:redseaboats/Common/AppColors/app_colors.dart';
import 'package:redseaboats/Common/AppText/appText.dart';
import 'package:redseaboats/Common/SizeConfig/size_config.dart';

import 'Component/single_user_chat_appBar.dart';
import 'Component/single_user_chat_tile.dart';
import 'Component/single_user_input_tile.dart';

class SingleUserChatView extends StatelessWidget {
   SingleUserChatView({super.key});
   final singleUserChatVM = SingleUserChatViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white.withOpacity(1),
      appBar: singleUserChatAppBar(
        title: 'Dubai Water Sports',
        status: 'Online',
        imageUrl: 'https://cdn.pixabay.com/photo/2016/04/25/10/17/starfishes-1351559__340.jpg'
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              ()=> ListView.builder(
                shrinkWrap: true,
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 6.0, vertical:  SizeConfig.heightMultiplier * 2.0),
                // shrinkWrap: true,
                itemCount: singleUserChatVM.chatList.length,
                itemBuilder: (context, oldIndex){
                  final index = (singleUserChatVM.chatList.length - 1) - oldIndex;
                  return singleUserChatTile(
                    time: singleUserChatVM.chatList[index].time,
                      check: singleUserChatVM.chatList[index].check.value,
                      msg: singleUserChatVM.chatList[index].msg
                      
                  );
              }),
            ),
          ),
          singleUserInputTile(
        controller: singleUserChatVM.chatInputController,
        cameravoidCallback: (){

        },
        recordingvoidCallback: (){

        },
        sendvoidCallback: (){
          singleUserChatVM.chatList.add(SingleChatModel(
            check: singleUserChatVM.random.nextBool().obs, 
            msg: singleUserChatVM.chatInputController.text,
            time: singleUserChatVM.time.toString()
            )
            );
          print(singleUserChatVM.chatList.length);
        },
        
      ),
        ],
      ),
    );
  }

}