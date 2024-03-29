import '../models/sushi.dart';

class DummyData {
  static List<Sushi> getSushiData() {
    List<Map<String, dynamic>> sushiInfo = [
      {
        'id': 1,
        'name': 'Aji',
        'price': 15.99,
        'rating': 4.5,
        'description':
            'Aji sushi is a flavorful and aromatic delight, featuring slices of horse mackerel atop perfectly seasoned rice.'
      },
      {
        'id': 2,
        'name': 'Anago',
        'price': 12.99,
        'rating': 4.0,
        'description':
            'Anago sushi, or saltwater eel, is a delicacy known for its tender texture and sweet, savory taste. A true sushi connoisseur\'s choice.'
      },
      {
        'id': 3,
        'name': 'Ebi',
        'price': 18.99,
        'rating': 4.8,
        'description':
            'Ebi, or shrimp sushi, showcases the natural sweetness of fresh shrimp. Served atop vinegared rice, it\'s a classic favorite.'
      },
      {
        'id': 4,
        'name': 'Ikura-maki',
        'price': 22.99,
        'rating': 4.2,
        'description':
            'Ikura-maki is a roll filled with succulent salmon roe, providing a burst of oceanic flavor with each bite.'
      },
      {
        'id': 5,
        'name': 'Iwashi',
        'price': 14.99,
        'rating': 3.9,
        'description':
            'Iwashi sushi features sardines, offering a bold and rich taste that seafood enthusiasts appreciate.'
      },
      {
        'id': 6,
        'name': 'Kohada',
        'price': 19.99,
        'rating': 4.6,
        'description':
            'Kohada, or gizzard shad sushi, is characterized by its silver-skinned appearance and distinctive, slightly tangy taste.'
      },
      {
        'id': 7,
        'name': 'Maguro',
        'price': 25.99,
        'rating': 4.7,
        'description':
            'Maguro sushi showcases the finest cuts of tuna, providing a buttery texture and robust flavor that sushi lovers adore.'
      },
      {
        'id': 8,
        'name': 'Salmon',
        'price': 20.99,
        'rating': 4.3,
        'description':
            'Salmon sushi is a versatile and popular choice, known for its smooth, rich taste and vibrant color.'
      },
      {
        'id': 9,
        'name': 'Sanma',
        'price': 17.99,
        'rating': 4.1,
        'description':
            'Sanma sushi, or Pacific saury, features a unique, slightly oily flavor that pairs well with vinegared rice.'
      },
      {
        'id': 10,
        'name': 'Sawara',
        'price': 21.99,
        'rating': 4.4,
        'description':
            'Sawara, or Spanish mackerel sushi, offers a delightful combination of firm texture and delicate flavor.'
      },
      {
        'id': 11,
        'name': 'Shime-saba',
        'price': 16.99,
        'rating': 4.0,
        'description':
            'Shime-saba, or cured mackerel, is known for its marinated taste, making it a favorite among sushi enthusiasts.'
      },
      {
        'id': 12,
        'name': 'Tako',
        'price': 23.99,
        'rating': 4.8,
        'description':
            'Tako sushi features octopus, prized for its tender yet chewy texture and ability to absorb surrounding flavors.'
      },
      {
        'id': 13,
        'name': 'Tamagoyaki',
        'price': 13.99,
        'rating': 4.5,
        'description':
            'Tamagoyaki, or sweet Japanese omelet, is a comforting and slightly sweet sushi option enjoyed by all ages.'
      },
      {
        'id': 14,
        'name': 'Tekka-maki',
        'price': 19.99,
        'rating': 4.6,
        'description':
            'Tekka-maki, or tuna roll, is a classic sushi roll featuring high-quality tuna encased in a layer of nori and rice.'
      },
      {
        'id': 15,
        'name': 'Umeshisomaki',
        'price': 15.99,
        'rating': 4.2,
        'description':
            'Umeshisomaki is a delightful roll featuring pickled plum, offering a sweet and tangy contrast to the rice.'
      },
      {
        'id': 16,
        'name': 'Unagi',
        'price': 24.99,
        'rating': 4.7,
        'description':
            'Unagi, or freshwater eel, is grilled to perfection and glazed with a sweet soy-based sauce, creating a delectable sushi experience.'
      },
      {
        'id': 17,
        'name': 'Uni',
        'price': 27.99,
        'rating': 4.9,
        'description':
            'Uni sushi features sea urchin roe, prized for its unique flavor profile and creamy texture that melts in the mouth.'
      },
      {
        'id': 18,
        'name': 'Wagyu',
        'price': 29.99,
        'rating': 4.8,
        'description':
            'Wagyu sushi showcases the finest Japanese beef, offering a luxurious and indulgent sushi experience.'
      },
    ];

    List<Sushi> sushiList = [];

    for (var info in sushiInfo) {
      int id = info['id'];
      String name = info['name'];
      double price = info['price'];
      double rating = info['rating'];
      String description = info['description'];

      String imagePath = 'images/${name.toLowerCase()}.png';

      Sushi sushi = Sushi(
        id: id,
        name: name,
        price: price,
        rating: rating,
        description: description,
        image: imagePath,
      );
      sushiList.add(sushi);
    }

    return sushiList;
  }
}
