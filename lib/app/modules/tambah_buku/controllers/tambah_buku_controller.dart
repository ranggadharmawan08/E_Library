import 'package:e_library/app/data/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class TambahBukuController extends GetxController {
  var namaBuku = ''.obs;
  var deskripsi = ''.obs;
  var selectedPdfPath = ''.obs;

  // Fungsi untuk mengatur nama buku
  void setNamaBuku(String value) {
    namaBuku.value = value;
  }

  // Fungsi untuk mengatur deskripsi
  void setDeskripsi(String value) {
    deskripsi.value = value;
  }

  // Fungsi untuk memilih file PDF
  Future<void> pickPdfFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'], // Hanya file PDF
      );

      if (result != null) {
        selectedPdfPath.value = result.files.single.path ?? '';
      } else {
        selectedPdfPath.value = '';
        Get.snackbar(
          'Error',
          'Tidak ada file yang dipilih',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat memilih file: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Fungsi untuk menyimpan data ke SQLite
  Future<void> saveBuku() async {
    if (selectedPdfPath.value.isNotEmpty &&
        namaBuku.value.isNotEmpty &&
        deskripsi.value.isNotEmpty) {
      Map<String, dynamic> bukuData = {
        'nama': namaBuku.value,
        'deskripsi': deskripsi.value,
        'filePath': selectedPdfPath.value,
      };

      // Menyimpan data ke SQLite
      await DatabaseHelper().insertBuku(bukuData);

      Get.snackbar(
        'Sukses',
        'Data berhasil disimpan!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Arahkan ke halaman HomeView
      Get.offAllNamed(
          '/home'); // Menggunakan Get.offAll untuk memastikan stack halaman dibersihkan
    } else {
      Get.snackbar(
        'Error',
        'Harap lengkapi semua field dan pilih file PDF',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
