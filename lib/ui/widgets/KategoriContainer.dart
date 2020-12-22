part of 'widgets.dart';

class KategoriContainer extends StatelessWidget {
  final String kategori;
  KategoriContainer({this.kategori});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: HexColor("BEBEEA"),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(kategori),
          ),
        ),
      ),
    );
  }
}
