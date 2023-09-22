import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../model/album.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
      ),
      body: FutureBuilder<List<Album>>(
        future: controller.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Terjadi kesalahan: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Tidak ada data"),
            );
          } else {
            final albums = snapshot.data!;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return ListTile(
                  onTap: () => Get.toNamed(Routes.UPDATE_DATA, arguments: album),
                  leading: CircleAvatar(
                    child: Text(album.id.toString()),
                  ),
                  title: Text(album.title.toUpperCase(), maxLines: 1, overflow: TextOverflow.ellipsis,),
                  subtitle: Text(album.thumbnailUrl),
                  trailing: IconButton(
                      onPressed: () {
                        controller.deleteAlbumById(index);
                      },
                      color: Colors.red,
                      icon: const Icon(Icons.delete)),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_DATA);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
