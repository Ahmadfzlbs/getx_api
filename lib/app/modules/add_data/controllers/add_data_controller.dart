import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddDataController extends GetxController {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  final String apiUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<void> addData() async {
    final id = idController.text;
    final title = titleController.text;
    final url = urlController.text;

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'id': id,
        'title': title,
        'url': url,
      },
    );

    if (response.statusCode == 200) {
      Get.snackbar('Sukses', 'Data berhasil ditambahkan ke API');
    } else {
      Get.snackbar('Kesalahan', 'Gagal menambahkan data ke API');
    }
  }
}
