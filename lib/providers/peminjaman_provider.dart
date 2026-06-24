import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/peminjaman.dart';

// Peminjaman List Provider
final peminjamanListProvider = StateProvider<List<Peminjaman>>((ref) => []);

// Active Peminjaman
final activePeminjamanProvider = FutureProvider<List<Peminjaman>>((ref) async {
  final allPeminjaman = ref.watch(peminjamanListProvider);
  return allPeminjaman
      .where((p) => p.status == 'dipinjam' || p.status == 'terlambat')
      .toList();
});

// Overdue Peminjaman
final overduePeminjamanProvider = FutureProvider<List<Peminjaman>>((ref) async {
  final allPeminjaman = ref.watch(peminjamanListProvider);
  return allPeminjaman.where((p) => p.isTerlambat).toList();
});

// Peminjaman History
final peminjamanHistoryProvider = FutureProvider<List<Peminjaman>>((ref) async {
  final allPeminjaman = ref.watch(peminjamanListProvider);
  return allPeminjaman
      .where((p) => p.status == 'dikembalikan')
      .toList();
});

// Statistics
final peminjamanStatsProvider = FutureProvider<Map<String, int>>((ref) async {
  final allPeminjaman = ref.watch(peminjamanListProvider);
  return {
    'total': allPeminjaman.length,
    'dipinjam': allPeminjaman.where((p) => p.status == 'dipinjam').length,
    'dikembalikan': allPeminjaman.where((p) => p.status == 'dikembalikan').length,
    'terlambat': allPeminjaman.where((p) => p.isTerlambat).length,
    'hilang': allPeminjaman.where((p) => p.status == 'hilang').length,
  };
});
