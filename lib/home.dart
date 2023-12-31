import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Définition de la structure de données pour une carte
  final List<CardItem> cardItems = [
    CardItem(icon: Icons.local_drink, title: "Bar"),
    CardItem(icon: Icons.restaurant, title: "Resto"),
    CardItem(icon: Icons.sports, title: "Sports"),
    CardItem(icon: Icons.child_friendly, title: "Enfants"),
    CardItem(icon: Icons.gamepad, title: "Jeux"),
    CardItem(icon: Icons.shopping_cart, title: "Shop"),
    CardItem(icon: Icons.local_movies, title: "Cinéma"),
  ];
  // Définition de la structure de données pour les cartes détaillées
  final List<DetailCardItem> detailCardItems = [
    DetailCardItem(image: "assets/eurock.jpg", title: "Titre 1"),
    DetailCardItem(image: "assets/eurock.jpg", title: "Titre 2"),
    DetailCardItem(image: "assets/eurock.jpg", title: "Titre 3"),
    // DetailCardItem(image: '', title: "Titre 2"),
    // Ajoutez plus d'éléments ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 10,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width - 1,
        height: MediaQuery.of(context).size.height - 1,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Catégories",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 80, // Hauteur fixe pour les cartes
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0
                          ? 8.0
                          : 4.0, // Espacement supplémentaire pour la première carte
                      right: 4.0,
                    ),
                    child: _buildCard(cardItems[index]),
                  );
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 80),

            Container(
              padding: const EdgeInsets.all(8.0),
              // color: Colors.grey[800],
              width: MediaQuery.of(context).size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      "Aujourd'hui",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Card(
                        elevation: 3,
                        margin: EdgeInsets.all(8.0),
                        color: Colors.white,
                        child: SizedBox(
                          width: 380,
                          height: 270,
                          child: Center(
                            child: Text(
                              'Carte',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100, // Hauteur fixe pour les cartes détaillées
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: detailCardItems.length,
                    itemBuilder: (context, index) =>
                        _buildDetailCard(detailCardItems[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(CardItem item) {
    return Card(
      elevation: 2, // Réduisez ou supprimez pour moins d'effet d'élévation
      color: Colors.grey[200],
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 5,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 20),
              Text(
                item.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDetailCard(DetailCardItem item) {
  return Center(
    child: Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 8.0, left: 8.0),
      child: SizedBox(
        width: 150, // Largeur de la carte
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              item.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class CardItem {
  final IconData icon;
  final String title;

  CardItem({required this.icon, required this.title});
}

class DetailCardItem {
  final String image;
  final String title;

  DetailCardItem({required this.image, required this.title});
}
