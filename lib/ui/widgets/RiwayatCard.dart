part of 'widgets.dart';

class RiwayatCard extends StatelessWidget {
  final String name, date, img;
  RiwayatCard({this.name, this.date, this.img});

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
          title: Text(
            name,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(date),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(img, scale: 30),
          ),
        ),
      ),
    );
  }
}
