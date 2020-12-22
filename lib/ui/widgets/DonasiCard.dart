part of 'widgets.dart';

class DonasiCard extends StatelessWidget {
  final String name, date, img;
  final int tipeUser;
  DonasiCard({this.name, this.date, this.img, this.tipeUser});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          onTap: () {
            if (tipeUser == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailDonasiScreen(
                            name: name,
                            img: img,
                          )));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RIDetailDonasiScreen(
                            name: name,
                            img: img,
                          )));
            }
          },
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
