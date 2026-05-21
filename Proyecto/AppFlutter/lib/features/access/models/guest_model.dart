class Guest {
  final int id;
  final String nombreCompleto;
  final String fechaVisita;
  final bool esValida;
  final String qrUri;

  Guest({
    required this.id,
    required this.nombreCompleto,
    required this.fechaVisita,
    required this.esValida,
    required this.qrUri,
  });

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      id: json['id'],
      nombreCompleto: json['nombre_completo'],
      fechaVisita: json['fecha_visita'],
      esValida: json['es_valida'],
      qrUri: json['qr_uri'],
    );
  }
}
