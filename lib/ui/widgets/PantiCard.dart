part of 'widgets.dart';

class PantiCard extends StatelessWidget {
  final String namaPanti, img;
  // final List category = ['Alat Tulis', 'Pakaian', 'Mainan'];
  final List<String> category;
  PantiCard({this.namaPanti, this.img, this.category});
  // PantiCard({this.namaPanti, this.img});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
            contentPadding: EdgeInsets.all(8),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPantiScreen()));
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
                      KategoriContainer(
                        kategori: '${category[1]}',
                      ),
                      KategoriContainer(
                        kategori: '${category[2]}',
                      ),
                      KategoriContainer(
                        kategori: '${category[0]}',
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
