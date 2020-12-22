part of 'widgets.dart';

class PantiCard extends StatelessWidget {
  final String namaPanti, img;
  final List<String> category;
  PantiCard({this.namaPanti, this.img, this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          onTap: () {},
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(img, scale: 30),
          ),
          title: Text(
            namaPanti,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
