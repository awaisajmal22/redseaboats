import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:redseaboats/App/ChatModule/SingleUserChat/Model/single_chat_model.dart';

class SingleUserChatViewModel extends GetxController{
   
  final  time = DateFormat.jm().format(DateTime.now());
  final chatInputController = TextEditingController();


  RxList<SingleChatModel> chatList = <SingleChatModel>[
    SingleChatModel(check: false.obs, msg: 'I have also interested on the nice green country, One of my cousin visited there. And I am really excited',
    time: '6:00 PM'),
    SingleChatModel(check: true.obs, msg: 'I have also interested on ', time: '3:45 AM'),
   
  ].obs;

  Random random = Random();
}