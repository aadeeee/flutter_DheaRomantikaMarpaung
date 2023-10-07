class Contact {
  final int? id;
  final String nama;
  final int nomor;

  Contact({
    this.id,
    required this.nama,
    required this.nomor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'nomor': nomor,
    };
  }
}
