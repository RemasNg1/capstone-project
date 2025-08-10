import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> uploadSingleImage(XFile image) async {
  final client = Supabase.instance.client;
  final bucket = client.storage.from('avatars');

  try {
    final compressedBytes = await FlutterImageCompress.compressWithFile(
      image.path,
      quality: 75,
    );

    if (compressedBytes == null) {
      throw Exception('Failed to compress image');
    }

    final extension = image.name.split('.').last.toLowerCase();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = 'avatar_${timestamp}_${image.name}';

    String contentType = 'image/jpeg';
    if (extension == 'png') contentType = 'image/png';

    await bucket.uploadBinary(
      fileName,
      compressedBytes,
      fileOptions: FileOptions(upsert: true, contentType: contentType),
    );

    final publicUrl = bucket.getPublicUrl(fileName);
    print('[Upload] $publicUrl');
    return publicUrl;
  } catch (e) {
    debugPrint('Error uploading image: $e');
    return null;
  }
}
