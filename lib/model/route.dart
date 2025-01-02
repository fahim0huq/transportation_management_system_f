// Model class
class Route{
  int? id;
  String? route;

  // Constructor
  Route({
    this.id,
    this.route,
  });

  // For saving data to DB (toMap)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'route': route,
    };
  }

  // For retrieving data from DB (fromMap)
  static Route fromMap(Map<String, dynamic> map) {
    return Route(
      id: map['id'],
      route: map['route'],
    );
  }
}