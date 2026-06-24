import 'package:flutter/material.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String adminDashboard = '/admin-dashboard';
  static const String adminBuku = '/admin-buku';
  static const String adminSiswa = '/admin-siswa';
  static const String adminPeminjaman = '/admin-peminjaman';
  static const String adminLaporan = '/admin-laporan';
  static const String siswaDashboard = '/siswa-dashboard';
  static const String siswaDaftarBuku = '/siswa-daftar-buku';
  static const String siswaRiwayat = '/siswa-riwayat';
  static const String siswaProfil = '/siswa-profil';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
