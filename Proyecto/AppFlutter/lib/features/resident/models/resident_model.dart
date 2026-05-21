class Resident {
  final int id;
  final int usuario;
  final String nombreCompleto;
  final String email;
  final int? casaId;
  final House? casaDetalle;

  Resident({
    required this.id,
    required this.usuario,
    required this.nombreCompleto,
    required this.email,
    this.casaId,
    this.casaDetalle,
  });

  factory Resident.fromJson(Map<String, dynamic> json) {
    return Resident(
      id: json['id'],
      usuario: json['usuario'],
      nombreCompleto: json['nombre_completo'],
      email: json['email'],
      casaId: json['casa'] is int ? json['casa'] : (json['casa'] != null ? json['casa']['id'] : null),
      casaDetalle: (json['casa_detalle'] != null && json['casa_detalle'] is Map<String, dynamic>)
          ? House.fromJson(json['casa_detalle'])
          : null,
    );
  }
}

class House {
  final int id;
  final manzana;
  final lote;
  final String calle;
  final String numeroExterior;
  

  House({
    required this.id,
    required this.manzana,
    required this.lote,
    required this.calle,
    required this.numeroExterior
  });

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      id: json['id'],
      manzana: json['manzana'],
      lote: json['lote'],
      calle: json['calle'],
      numeroExterior: json['numero_exterior'],
      
    );
  }
}
