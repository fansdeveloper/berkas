part of 'widgets.dart';

class PantiCard extends StatelessWidget {
  final String namaPanti, img, pantiID, alamatPanti, kotaPanti;
  final int perempuan, laki;
  final bool onClick;
  final List<dynamic> category, selectedCategory;

  PantiCard(
      {this.namaPanti,
      this.pantiID,
      this.perempuan,
      this.laki,
      this.alamatPanti,
      this.kotaPanti,
      this.img,
      this.category,
      this.selectedCategory,
      this.onClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
              contentPadding: EdgeInsets.all(8),
              onTap: () {
                onClick
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPantiScreen(
                                pantiID: pantiID,
                                namaPanti: namaPanti,
                                alamatPanti: alamatPanti,
                                kotaPanti: kotaPanti,
                                kategoriPanti: category,
                                perempuan: perempuan,
                                laki: laki,
                                kategoriDonatur: selectedCategory)))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseCategoryScreen()));
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(img, scale: 30),
              ),
              title: Text(
                namaPanti,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        for (var i in category)
                          KategoriContainer(
                            kategori: i.toString(),
                          )
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
