class Content {
  final String name;
  final String image;

  const Content({
    required this.name,
    required this.image,
  });
}

class UserData {
  final String name;
  final String image;
  final String description;

  const UserData({
    required this.name,
    required this.image,
    this.description = "",
  });
}
