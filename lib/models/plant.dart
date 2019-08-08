class Plant {
  String name;
  String image;
  double price;

  Plant({
    this.name,
    this.image,
    this.price = 0.0,
  });

  static fromJSON(Map<String, dynamic> json) {
    final plant = Plant();
    plant.name = json['name'];
    plant.image = json['image'];
    plant.price = json['price'];
    return plant;
  }

  static placeholder() {
    final plant = Plant();
    plant.name = 'placeholder name';
    plant.image = 'assets/images/banyan-green-bamboo-potted.png';
    plant.price = 10.0;
    return plant;
  }
}
