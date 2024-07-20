import 'package:flutter/material.dart';
import 'package:hotel_app/constants/colors.dart';
import 'package:hotel_app/screen/detail_screen.dart';
import 'package:hotel_app/data/model/hotel.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Hotel> hotels = [
    Hotel(
      'Passalacqua',
      'Via Besana, 59, 22010 Moltrasio CO, Italy',
      'https://www.theworlds50best.com/hotels/filestore/jpg/W50BH23_PROFILE_Passalacqua%20hero.jpg',
      "Set in an 18th-century villa that was the former home of composer Vincenzo Bellini, Passalacqua is the creation of the De Santis family, who are also behind Grand Hotel Tremezzo. Set within spectacular terraced gardens and unfolding over just 24 rooms, the hotel showcases the finest Italian craftsmanship in a sumptuous riot of ornate Baroque elegance. All this comes together in a sublime retreat – almost like a private home – that makes the most of this truly magical lakefront location: just what you’d expect of the inaugural The World’s Best Hotel 2023.",
      "1300",
      [
        "https://www.theworlds50best.com/hotels/filestore/jpg/W50BH23_PROFILE_Passalacqua%20hero.jpg",
        "https://www.theworlds50best.com/hotels/filestore/jpg/W50BH23_PROFILE_Passalacqua%20room%202.jpg",
        "https://www.theworlds50best.com/hotels/filestore/jpg/W50BH23_PROFILE_Passalacqua%20terrace.jpg",
      ],
    ),
    Hotel(
      'Rosewood Hong Kong',
      '18 Salisbury Rd, Tsim Sha Tsui, Hong Kong',
      'https://www.theworlds50best.com/hotels/filestore/jpg/W50BH23_PROFILE_Rosewood%20Hong%20Kong%20room.jpg',
      "When Rosewood Hong Kong opened in 2019, its 65-storey tower became an unmistakable feature of the city’s skyline. It’s the Rosewood Hotel Group’s seventh location to open in Asia, delivering its signature luxe hospitality experience set to the stunning backdrop of Victoria Harbour and now named The Best Hotel in Asia 2023.",
      "650",
      [
        "https://www.theworlds50best.com/hotels/filestore/jpg/W50BH23_PROFILE_Rosewood%20Hong%20Kong%20room.jpg",
        "https://www.theworlds50best.com/hotels/filestore/jpg/W50BH23_PROFILE_Rosewood%20Hong%20Kong%20lobby.jpg",
        "https://www.theworlds50best.com/hotels/filestore/jpg/W50BH23_PROFILE_Rosewood%20Hong%20Kong%20EXTERIOR.jpg",
      ],
    ),
    Hotel(
      'Four Seasons Bangkok',
      '300/1 Charoen Krung Rd, Khwaeng Yan Nawa, Khet Sathon, Bangkok 10120, Thailand',
      'https://www.theworlds50best.com/hotels/filestore/jpg/W50BH23_PROFILE_Four%20Seasons%20Bangkok%20hero.jpg',
      "A design-savvy urban retreat that’s as much about good times as it is bona fide rest and relaxation. Set on the banks of the River of Kings, it comprises 299 contemporary rooms and suites set across multiple storeys, with a palm-framed, multi-layered pool area, Mediterranean-leaning gardens and an incredible wellness centre with a spa inspired by ancient Thai rituals. Big, bold and buzzy, it’s a key player in Bangkok’s new-wave hotel scene.",
      "450",
      [
        "https://www.theworlds50best.com/hotels/filestore/jpg/W50BH23_PROFILE_Four%20Seasons%20Bangkok%20hero.jpg",
        "https://www.theworlds50best.com/hotels/filestore/jpg/W50BH23_PROFILE_Four%20Seasons%20Bangkok%20room.jpg",
        "https://www.theworlds50best.com/hotels/filestore/jpg/W50BH23_PROFILE_Four%20Seasons%20Bangkok%20exterior.jpg",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: Text(
                            "Explore",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Iconsax.location,
                              color: Blue,
                              size: 40,
                            ),
                            Text(
                              " World",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      child: Icon(
                        Iconsax.notification,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    tabs("Hotel", Iconsax.home),
                    SizedBox(width: 20),
                    tabs("lodging house", Iconsax.house_2),
                    SizedBox(width: 20),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 250,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                      itemCount: hotels.length,
                      itemBuilder: (context, index) {
                        return hotelContainer(context, hotels[index].name,
                            hotels[index].imageUrls, index);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Popular",
                    style: TextStyle(fontSize: 26),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 250,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                      itemCount: hotels.length,
                      itemBuilder: (context, index) {
                        return hotelContainer(context, hotels[index].name,
                            hotels[index].imageUrls, index);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabs(String name, IconData icon) {
    return IntrinsicWidth(
      stepWidth: 45,
      child: Container(
        height: 40,
        decoration:
            BoxDecoration(color: Blue, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              " $name",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget hotelContainer(context, String name, String image, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(hotel: hotels[index]),
            ),
          );
        },
        child: Card(
          elevation: 5,
          child: Container(
            width: 355,
            height: 355,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicWidth(
                  stepWidth: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(59),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        name,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                IntrinsicWidth(
                  stepWidth: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(59),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            '4.1',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
