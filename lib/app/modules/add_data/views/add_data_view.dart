import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_data_controller.dart';

class AddDataView extends GetView<AddDataController> {
  const AddDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: controller.idController,
                style: const TextStyle(fontSize: 17),
                decoration: const InputDecoration(
                    labelText: 'ID', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.titleController,
                style: const TextStyle(fontSize: 17),
                decoration: const InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.urlController,
                style: const TextStyle(fontSize: 17),
                decoration: const InputDecoration(
                    labelText: 'URL', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: Size(Get.width, 45)),
                onPressed: () {
                  controller.addData();
                },
                child: const Text("Tambah Data"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
