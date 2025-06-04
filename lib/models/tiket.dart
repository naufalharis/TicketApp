class Tiket {
  final String name;
  final String category;
  final String type;
  final int price;

  Tiket({
    required this.name,
    required this.category,
    required this.type,
    required this.price,
  });

  // Untuk mengubah data dari Firestore (Map) jadi objek Tiket
  factory Tiket.fromMap(Map<String, dynamic> map) {
    return Tiket(
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      type: map['type'] ?? '',
      price: map['price'] ?? 0,
    );
  }

  // Jika kamu ingin mengirim data balik ke Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'type': type,
      'price': price,
    };
  }
}
