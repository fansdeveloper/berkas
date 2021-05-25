import 'dart:convert';
import 'dart:io';

import 'package:berkas/models/City.dart';
import 'package:berkas/models/models.dart';
import 'package:berkas/extensions/extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

part 'DonasiServices.dart';
part 'AuthServices.dart';
part 'UsersServices.dart';
part 'RIServices.dart';
