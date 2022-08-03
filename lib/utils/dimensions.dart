import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.58;
  static double pageViewContainer = screenHeight / 3.75;
  static double pageViewTextContainer = screenHeight / 6.88;

  //dynamic height padding and margin
  static double height10 = screenHeight / 82.55;
  static double height15 = screenHeight / 55.03;
  static double height20 = screenHeight / 40.27;
  static double height30 = screenHeight / 27.51;
  static double height45 = screenHeight / 18.34;

  //dynamic width  padding and margin
  static double width10 = screenHeight / 82.55;
  static double width15 = screenHeight / 55.03;
  static double width20 = screenHeight / 40.27;
  static double width30 = screenHeight / 27.51;

  //font size26
  static double font20 = screenHeight / 40.27;
  static double font16 = screenHeight / 52.5;
  static double font26 = screenHeight / 32.1;

  //radius
  static double radius15 = screenHeight / 55.03;
  static double radius20 = screenHeight / 82.55;
  static double radius30 = screenHeight / 27.51;

  //icon size
  static double iconSize24 = screenHeight / 34.39;
  static double iconSize16 = screenHeight / 52.3;

  //list view size
  static double ListViewImgSize = screenWidth/3.15;
  static double ListViewTextContSize = screenWidth/3.7;

  //popular food
  static double popularFoodImgSize = screenHeight/2.35;

  //bottom height
  static double bottomHeightbar = screenHeight/6.95;

  //splash screemn dimensions
static double splashImg= screenHeight/3.38;




}