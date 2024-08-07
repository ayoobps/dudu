import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:dudu/banner-images/model/banner_image_model.dart';

class BannerImageController extends GetxController {
  var bannerImages = <BannerImage>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBannerImages();
  }

  void fetchBannerImages() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('bannerimage')
        .orderBy('uploadedAt', descending: true)
        .get();

    final List<BannerImage> images = snapshot.docs
        .map((doc) => BannerImage.fromFirestore(doc.id, doc.data()))
        .toList();

    bannerImages.value = images;
  }
}