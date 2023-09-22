import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../model/album.dart';

class UpdateDataController extends GetxController {

  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController albumIdController = TextEditingController();

  List<Album> albums = [];

  void updateAlbumById(int id, Album updatedAlbum) {
    final albumIndex = albums.indexWhere((album) => album.id == id);

    if (albumIndex != -1) {
      albums[albumIndex] = updatedAlbum;
    }
  }
}
