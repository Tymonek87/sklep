class GroceryProduct {
  const GroceryProduct({
    this.price,
    this.name,
    this.description,
    this.image,
    this.weight,
});
  final double price;
  final String name;
  final String description;
  final String image;
  final String weight;
}

const groceryProducts = <GroceryProduct>[
  GroceryProduct(
      price: 8.9,
      name: "Cebula",
      description: "Biała cebula jak każda inna",
      image:"assets/cebula.png",
      weight: "1000g"
  ),
  GroceryProduct(
      price: 3.5,
      name: "cytryna",
      description: "Cytryna kwaśna jak diabli",
      image:"assets/cytryna.png",
      weight: "1000g"
  ),
  GroceryProduct(
      price: 12.8,
      name: "Czereśnia",
      description: "Czereśnia pyszna jak zwykle",
      image:"assets/czeresnia.png",
      weight: "1000g"
  ),
  GroceryProduct(
      price: 8.9,
      name: "Limonka",
      description: "Limonka idealna do Mohito",
      image:"assets/lemonka.png",
      weight: "1000g"
  ),
  GroceryProduct(
      price: 9.99,
      name: "Malina",
      description: "Malina na sok",
      image:"assets/malina.png",
      weight: "1000g"
  ),
  GroceryProduct(
      price: 34.7,
      name: "Mango",
      description: "Mango i ni ma ch...",
      image:"assets/marakuja.png",
      weight: "1000g"
  ),
  GroceryProduct(
      price: 8.9,
      name: "Pomidor",
      description: "Pomidor jest czerwony",
      image:"assets/pomidor.png",
      weight: "1000g"
  ),
  GroceryProduct(
      price: 2,
      name: "Pożeczka",
      description: "Pożeczki nie lubię pożeczek",
      image:"assets/pozeczka.png",
      weight: "1000g"
  ),
];