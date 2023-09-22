import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../model/album.dart';

class HomeController extends GetxController {

  final albums = RxList<Album>([]);

  Future<List<Album>> getAllData() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var res = await http.get(url);

    if (res.statusCode == 200) {
      List<dynamic> data = json.decode(res.body) as List<dynamic>;
      if (data.isEmpty) {
        return [];
      } else {
        return data.map((e) => Album.fromJson(e as Map<String, dynamic>)).toList();
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  void deleteAlbumById(int id) {
    final albumToDelete = albums.firstWhere(
          (album) => album.id == id,
      orElse: () => Album(
        albumId: 1,
        id: 1,
        title: "accusamus beatae ad facilis cum similique qui sunt",
        url: "https://via.placeholder.com/600/92c952",
        thumbnailUrl: "https://via.placeholder.com/150/92c952"
      ),
    );

    if (albumToDelete.id != -1) {
      Get.defaultDialog(
        barrierDismissible: false,
        title: "Konfirmasi",
        middleText: "Apakah Anda yakin ingin menghapus album ini?",
        textConfirm: "Ya",
        confirmTextColor: Colors.white,
        textCancel: "Tidak",
        onConfirm: () {
          albums.remove(albumToDelete);
          Get.back();
        },
      );
    }
  }

}
