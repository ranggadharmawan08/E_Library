import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ubah_buku_controller.dart';

class UbahBukuView extends GetView<UbahBukuController> {
  const UbahBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Buku'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              controller.updateBuku(); // Panggil fungsi untuk memperbarui data
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: TextEditingController(text: controller.buku['nama']),
              decoration: const InputDecoration(labelText: 'Nama Buku'),
              onChanged: (value) {
                controller.buku['nama'] = value; // Update nama buku
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(text: controller.buku['deskripsi']),
              decoration: const InputDecoration(labelText: 'Deskripsi Buku'),
              onChanged: (value) {
                controller.buku['deskripsi'] = value; // Update deskripsi buku
              },
            ),
            const SizedBox(height: 16),
            // Tambahkan field lain jika diperlukan
          ],
        ),
      ),
    );
  }
}
