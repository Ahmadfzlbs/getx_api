import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../model/album.dart';
import '../controllers/update_data_controller.dart';

class UpdateDataView extends GetView<UpdateDataController> {
  const UpdateDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Album album = Get.arguments as Album;

    final TextEditingController idController =
    TextEditingController(text: album.id.toString());
    final TextEditingController titleController =
    TextEditingController(text: album.title);
    final TextEditingController urlController =
    TextEditingController(text: album.url);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: idController,
                style: const TextStyle(fontSize: 17),
                decoration: const InputDecoration(
                    labelText: 'ID', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: titleController,
                style: const TextStyle(fontSize: 17),
                decoration: const InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: urlController,
                style: const TextStyle(fontSize: 17),
                decoration: const InputDecoration(
                    labelText: 'URL', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: Size(Get.width, 45)),
                onPressed: () {
                  final updatedAlbum = Album(
                    id: int.parse(idController.text),
                    title: titleController.text,
                    url: urlController.text,
                    albumId: album.albumId,
                    thumbnailUrl: album.thumbnailUrl,
                  );

                  Get.back(result: updatedAlbum);
                  Get.snackbar("Berhasil", "Data berhasil diubah");

                },
                child: const Text("Ubah Data"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
