class AppConstants {
  // App Info
  static const String appName = 'Perpustakaan Digital';
  static const String appVersion = '1.0.0';
  static const String appCompany = 'PT. Digital Library';

  // Database
  static const String dbName = 'perpustakaan.db';
  static const int dbVersion = 1;

  // Shared Preferences Keys
  static const String spKeyUserId = 'user_id';
  static const String spKeyUserRole = 'user_role';
  static const String spKeyUserName = 'user_name';
  static const String spKeyUserEmail = 'user_email';
  static const String spKeyIsLoggedIn = 'is_logged_in';
  static const String spKeyThemeMode = 'theme_mode';
  static const String spKeyLanguage = 'language';

  // Asset Paths
  static const String assetImagesPath = 'assets/images/';
  static const String assetIconsPath = 'assets/icons/';
  static const String assetAnimationsPath = 'assets/animations/';

  // Time Durations
  static const Duration networkTimeout = Duration(seconds: 30);
  static const Duration debounceTime = Duration(milliseconds: 500);
  static const Duration animationDuration = Duration(milliseconds: 300);

  // Regular Expressions
  static const String emailRegex =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$';
  static const String phoneRegex = r'^(\+62|0)[0-9]{9,12}\$';
  static const String nisRegex = r'^[0-9]{10}\$';

  // Default Values
  static const int defaultPageSize = 20;
  static const int minPasswordLength = 6;

  // User Roles
  static const String roleAdmin = 'admin';
  static const String rolePetugas = 'petugas';
  static const String roleSiswa = 'siswa';

  // Loan Status
  static const String statusDipinjam = 'dipinjam';
  static const String statusDikembalikan = 'dikembalikan';
  static const String statusTerlambat = 'terlambat';
  static const String statusHilang = 'hilang';

  // Book Status
  static const String bookStatusTersedia = 'tersedia';
  static const String bookStatusDipinjam = 'dipinjam';
  static const String bookStatusRusak = 'rusak';
  static const String bookStatusHilang = 'hilang';

  // Messages
  static const String msgLoadingData = 'Memuat data...';
  static const String msgNoData = 'Data tidak ditemukan';
  static const String msgError = 'Terjadi kesalahan';
  static const String msgSuccess = 'Berhasil';
  static const String msgFailed = 'Gagal';
  static const String msgConfirm = 'Apakah Anda yakin?';
}
