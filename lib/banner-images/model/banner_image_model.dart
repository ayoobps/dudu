import 'package:cloud_firestore/cloud_firestore.dart';

class BannerImage {
  final String bannerid;
  final String imageUrl;
  final DateTime uploadedAt;

  BannerImage({
    required this.bannerid,
    required this.imageUrl,
    required this.uploadedAt,
  });

  factory BannerImage.fromFirestore(String bannerid, Map<String, dynamic> data) {
    return BannerImage(
      bannerid: bannerid,
      imageUrl: data['imageUrl'] as String,
      uploadedAt: (data['uploadedAt'] as Timestamp).toDate(),
    );
  }
}