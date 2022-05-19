class Restoran {
  final String id;
  final String name;
  final String image;
  final String address;
  final String location;


  Restoran(this.id, this.name, this.image, this.address, this.location, );

  Restoran.fromJson (Map<String, dynamic> json)
    :   id = json['id'],
        name = json['name'],
        image = json['image'],
        address = json['address'],
        location = json['location'];

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'image': image,
    'address': address,
    'location': location
  };

}