part of 'models.dart';

class Donasi extends Equatable {
  final String id, pantiID, donaturID, keterangan, noResi, lokasi, tujuan;
  final int fee;
  final double weight;
  final Timestamp date;
  final List<dynamic> kategori;
  final bool isConfirmed;

  Donasi(
      this.id,
      this.pantiID,
      this.donaturID,
      this.keterangan,
      this.lokasi,
      this.tujuan,
      this.fee,
      this.weight,
      this.date,
      this.kategori,
      this.isConfirmed,
      this.noResi);

  @override
  List<Object> get props => [
        id,
        pantiID,
        donaturID,
        keterangan,
        lokasi,
        tujuan,
        fee,
        weight,
        date,
        kategori,
        isConfirmed,
        noResi,
      ];
}
