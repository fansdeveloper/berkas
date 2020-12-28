part of 'models.dart';

class ResidentialInstitutions extends Equatable {
  final String id, keterangan;
  final int laki, perempuan;
  final List<dynamic> neededGoods;

  ResidentialInstitutions(
      this.id, this.keterangan, this.laki, this.perempuan, this.neededGoods);

  @override
  List<Object> get props => [id, keterangan, laki, perempuan, neededGoods];
}
