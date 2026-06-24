class Buku {
  final int? id;
  final String title;
  final String author;
  final String isbn;
  final String publisher;
  final int publishYear;
  final String category;
  final String? description;
  final String? photoUrl;
  final int stock;
  final int available;
  final String status; // tersedia, dipinjam, rusak, hilang
  final double? price;
  final DateTime createdAt;
  final DateTime updatedAt;

  Buku({
    this.id,
    required this.title,
    required this.author,
    required this.isbn,
    required this.publisher,
    required this.publishYear,
    required this.category,
    this.description,
    this.photoUrl,
    required this.stock,
    required this.available,
    this.status = 'tersedia',
    this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  Buku copyWith({
    int? id,
    String? title,
    String? author,
    String? isbn,
    String? publisher,
    int? publishYear,
    String? category,
    String? description,
    String? photoUrl,
    int? stock,
    int? available,
    String? status,
    double? price,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Buku(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      isbn: isbn ?? this.isbn,
      publisher: publisher ?? this.publisher,
      publishYear: publishYear ?? this.publishYear,
      category: category ?? this.category,
      description: description ?? this.description,
      photoUrl: photoUrl ?? this.photoUrl,
      stock: stock ?? this.stock,
      available: available ?? this.available,
      status: status ?? this.status,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'isbn': isbn,
      'publisher': publisher,
      'publishYear': publishYear,
      'category': category,
      'description': description,
      'photoUrl': photoUrl,
      'stock': stock,
      'available': available,
      'status': status,
      'price': price,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Buku.fromMap(Map<String, dynamic> map) {
    return Buku(
      id: map['id'],
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      isbn: map['isbn'] ?? '',
      publisher: map['publisher'] ?? '',
      publishYear: map['publishYear'] ?? 2024,
      category: map['category'] ?? '',
      description: map['description'],
      photoUrl: map['photoUrl'],
      stock: map['stock'] ?? 0,
      available: map['available'] ?? 0,
      status: map['status'] ?? 'tersedia',
      price: map['price'] != null ? double.tryParse(map['price'].toString()) : null,
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(map['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}
