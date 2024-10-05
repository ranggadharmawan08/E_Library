import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tambah_buku_controller.dart';

class TambahBukuView extends GetView<TambahBukuController> {
  const TambahBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Buku',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal, // Warna header lebih segar
        elevation: 0,
      ),
      body: SingleChildScrollView( // Menambahkan SingleChildScrollView di sini
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Field Nama Buku
            Text(
              'Nama Buku',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.teal[900],
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.teal.shade50,
                hintText: 'Masukkan nama buku',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: controller.setNamaBuku,
            ),
            const SizedBox(height: 16),
      
            // Field Deskripsi
            Text(
              'Deskripsi',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.teal[900],
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.teal.shade50,
                hintText: 'Masukkan deskripsi buku',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: 3,
              onChanged: controller.setDeskripsi,
            ),
            const SizedBox(height: 20),
      
            // Tombol Unggah File PDF
            ElevatedButton.icon(
              onPressed: controller.pickPdfFile,
              icon: const Icon(Icons.upload_file, color: Colors.white),
              label: const Text('Unggah PDF'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
      
            const SizedBox(height: 10),
      
            // Menampilkan Path File PDF yang Dipilih
            Obx(() {
              return Text(
                controller.selectedPdfPath.value.isEmpty
                    ? 'Tidak ada file yang dipilih'
                    : 'File: ${controller.selectedPdfPath.value}',
                style: TextStyle(
                  color: controller.selectedPdfPath.value.isEmpty
                      ? Colors.red
                      : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
      
            const SizedBox(height: 20), // Tambahkan jarak sebelum tombol simpan
            
            // Tombol Simpan
            Center(
              child: ElevatedButton(
                onPressed: controller.saveBuku,
                child: const Text('Simpan', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
