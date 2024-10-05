import 'package:e_library/app/modules/detail_buku/controllers/detail_buku_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  const DetailBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
          controller.buku['nama'] ?? 'Buku',
        )),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          Obx(() => IconButton(
                icon: Icon(
                  controller.buku['isLoved'] == 1
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: controller.buku['isLoved'] == 1
                      ? Colors.red
                      : Colors.white,
                ),
                onPressed: () {
                  controller.toggleLove(); // Toggle status love
                },
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan nama buku
            Obx(() => Text(
                  controller.buku['nama'] ?? 'Nama Buku',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 8),
            // Menampilkan deskripsi buku
            Obx(() => Text(
                  controller.buku['deskripsi'] ?? 'Deskripsi tidak tersedia',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                )),
            const SizedBox(height: 16),
            // Menampilkan PDF buku jika file path ada
            controller.buku['filePath'] != null &&
                    controller.buku['filePath'].toString().isNotEmpty
                ? Expanded(
                    child: PdfView(
                      controller: PdfController(
                        document: PdfDocument.openFile(
                            controller.buku['filePath']),
                        initialPage: 0,
                      ),
                    ),
                  )
                : const Text('File PDF tidak tersedia'),
          ],
        ),
      ),
    );
  }
}
