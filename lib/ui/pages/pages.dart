import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:berkas/services/services.dart';
import 'package:berkas/shared/shared.dart';
import 'package:berkas/ui/widgets/widgets.dart';
import 'package:berkas/models/models.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:flutter/cupertino.dart';
import 'package:timelines/timelines.dart';
import 'package:http/http.dart' as http;

part 'AccountScreen.dart';
part 'EditAccountScreen.dart';
part 'RIAccountScreen.dart';
part 'RiwayatDonaturScreen.dart';
part 'RIRiwayatScreen.dart';
part 'DonasiSayaScreen.dart';
part 'DetailDonasiScreen.dart';
part 'RIDetailDonasiScreen.dart';
part 'RIDonasiBaruScreen.dart';
part 'MainTabBar.dart';
part 'RIMainTabBar.dart';
part 'HomeScreenDonatur.dart';
part 'ChooseCategoryScreen.dart';
part 'DetailPembayaranScreen.dart';
part 'RIDonasiSelesaiScreen.dart';

part 'ChooseRIScreen.dart';
part 'DetailPantiScreen.dart';

part 'RIHomeScreen.dart';
part 'RIEditProfileScreen.dart';
part 'LacakBarangScreen.dart';

part 'SignInScreen.dart';
part 'SignUpChoose.dart';
part 'SignUpScreen.dart';

part 'RIEditGoodsNeeded.dart';
