class SampleModel {
  String name;
  String title;
  String subtitle;
  String imageUrl;
  int price;
  int id;

  SampleModel({
    this.name,
    this.title,
    this.id,
    this.subtitle,
    this.imageUrl,
    this.price,
  });
}

List<SampleModel> sampleList = [
  SampleModel(
    name: "محمد",
    title: "یاتاقان",
    subtitle: "دینا2",
    imageUrl: "assets/images/burger.jpg",
    price: 20,
    id: 1,
  ),
  SampleModel(
      name: "علی",
      title: "بوش پیستون",
      subtitle: "بازار",
      imageUrl: "assets/images/burger.jpg",
      price: 10,
      id: 2),
  SampleModel(
      name: "محمدرضا",
      title: "موتور",
      subtitle: "تهران",
      imageUrl: "assets/images/burger.jpg",
      price: 5,
      id: 3),
  SampleModel(
    name: "محسن",
    title: "چرخ",
    subtitle: "وزرا",
    imageUrl: "assets/images/burger.jpg",
    price: 30,
    id: 4,
  ),
  SampleModel(
    name: "اردشیر",
    title: "ترمز",
    subtitle: "وزرا",
    imageUrl: "assets/images/burger.jpg",
    price: 30,
    id: 4,
  ),
  SampleModel(
    name: "علیرضا",
    title: "داشبورد",
    subtitle: "قم",
    imageUrl: "assets/images/burger.jpg",
    price: 30,
    id: 4,
  ),
];

