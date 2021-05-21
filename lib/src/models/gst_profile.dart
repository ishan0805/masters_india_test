import 'dart:convert';

class GstProfile {
  final String name;
  final String status;
  final String address;
  final String taxpayerType;
  final String businessType;
  final String dataRagistration;
  GstProfile({
    this.name,
    this.status,
    this.address,
    this.taxpayerType,
    this.businessType,
    this.dataRagistration,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'status': status,
      'address': address,
      'taxpayerType': taxpayerType,
      'businessType': businessType,
      'dataRagistration': dataRagistration,
    };
  }

  factory GstProfile.fromMap(Map<String, dynamic> map) {
    return GstProfile(
      name: map['name'],
      status: map['status'],
      address: map['address'],
      taxpayerType: map['taxpayerType'],
      businessType: map['businessType'],
      dataRagistration: map['dataRagistration'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GstProfile.fromJson(String source) =>
      GstProfile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GstProfile(name: $name, status: $status, address: $address, taxpayerType: $taxpayerType, businessType: $businessType, dataRagistration: $dataRagistration)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GstProfile &&
        other.name == name &&
        other.status == status &&
        other.address == address &&
        other.taxpayerType == taxpayerType &&
        other.businessType == businessType &&
        other.dataRagistration == dataRagistration;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        status.hashCode ^
        address.hashCode ^
        taxpayerType.hashCode ^
        businessType.hashCode ^
        dataRagistration.hashCode;
  }
}
