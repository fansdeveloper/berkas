part of 'widgets.dart';

class PantiCard extends StatelessWidget {
  // final ResidentialInstitutions panti;
  final String namaPanti, img;
  // final List category = ['Alat Tulis', 'Pakaian', 'Mainan'];
  final List<dynamic> category;
  PantiCard({this.namaPanti, this.img, this.category});
  // PantiCard({this.namaPanti, this.img});
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPantiScreen(
                              kategori: category,
                            )));
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
