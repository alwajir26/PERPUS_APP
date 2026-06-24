class Peminjaman {
  final int? id;
  final int userId;
  final int bukuId;
  final String bukuTitle;
  final DateTime tanggalPinjam;
  final DateTime tanggalKembaliTarget;
  final DateTime? tanggalKembaliAktual;
  final String status; // dipinjam, dikembalikan, terlambat, hilang
  final int denda;
  final String? catatan;
  final DateTime createdAt;
  final DateTime updatedAt;

  Peminjaman({
    this.id,
    required this.userId,
    required this.bukuId,
    required this.bukuTitle,
    required this.tanggalPinjam,
    required this.tanggalKembaliTarget,
    this.tanggalKembaliAktual,
    this.status = 'dipinjam',
    this.denda = 0,
    this.catatan,
    required this.createdAt,
    required this.updatedAt,
  });

  Peminjaman copyWith({
    int? id,
    int? userId,
    int? bukuId,
    String? bukuTitle,
    DateTime? tanggalPinjam,
    DateTime? tanggalKembaliTarget,
    DateTime? tanggalKembaliAktual,
    String? status,
    int? denda,
    String? catatan,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Peminjaman(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      bukuId: bukuId ?? this.bukuId,
      bukuTitle: bukuTitle ?? this.bukuTitle,
      tanggalPinjam: tanggalPinjam ?? this.tanggalPinjam,
      tanggalKembaliTarget: tanggalKembaliTarget ?? this.tanggalKembaliTarget,
      tanggalKembaliAktual: tanggalKembaliAktual ?? this.tanggalKembaliAktual,
      status: status ?? this.status,
      denda: denda ?? this.denda,
      catatan: catatan ?? this.catatan,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'bukuId': bukuId,
      'bukuTitle': bukuTitle,
      'tanggalPinjam': tanggalPinjam.toIso8601String(),
      'tanggalKembaliTarget': tanggalKembaliTarget.toIso8601String(),
      'tanggalKembaliAktual': tanggalKembaliAktual?.toIso8601String(),
      'status': status,
      'denda': denda,
      'catatan': catatan,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Peminjaman.fromMap(Map<String, dynamic> map) {
    return Peminjaman(
      id: map['id'],
      userId: map['userId'] ?? 0,
      bukuId: map['bukuId'] ?? 0,
      bukuTitle: map['bukuTitle'] ?? '',
      tanggalPinjam: DateTime.parse(map['tanggalPinjam'] ?? DateTime.now().toIso8601String()),
      tanggalKembaliTarget: DateTime.parse(map['tanggalKembaliTarget'] ?? DateTime.now().toIso8601String()),
      tanggalKembaliAktual: map['tanggalKembaliAktual'] != null ? DateTime.parse(map['tanggalKembaliAktual']) : null,
      status: map['status'] ?? 'dipinjam',
      denda: map['denda'] ?? 0,
      catatan: map['catatan'],
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(map['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  bool get isTerlambat => DateTime.now().isAfter(tanggalKembaliTarget) && status == 'dipinjam';

  int get hitungDenda {
    if (!isTerlambat) return 0;
    final days = DateTime.now().difference(tanggalKembaliTarget).inDays;
    return days * 5000; // Rp 5000 per hari
  }
}
