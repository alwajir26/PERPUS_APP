import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/buku.dart';

// Buku List Provider
final bukuListProvider = StateProvider<List<Buku>>((ref) => []);

// Selected Buku Provider
final selectedBukuProvider = StateProvider<Buku?>((ref) => null);

// Search Query
final bukuSearchProvider = StateProvider<String>((ref) => '');

// Filter Category
final bukuCategoryProvider = StateProvider<String>((ref) => 'semua');

// Buku Filter
final filteredBukuProvider = FutureProvider<List<Buku>>((ref) async {
  final allBuku = ref.watch(bukuListProvider);
  final searchQuery = ref.watch(bukuSearchProvider).toLowerCase();
  final category = ref.watch(bukuCategoryProvider);

  var filtered = allBuku.where((buku) {
    final matchesSearch = buku.title.toLowerCase().contains(searchQuery) ||
        buku.author.toLowerCase().contains(searchQuery) ||
        buku.isbn.contains(searchQuery);
    final matchesCategory = category == 'semua' || buku.category == category;
    return matchesSearch && matchesCategory;
  }).toList();

  return filtered;
});
