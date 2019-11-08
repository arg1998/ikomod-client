class UserModel {
  final String name;
  final String id;
  final String email;
  final int level;
  final int rank;
  final int coins;
  final String bio;
  final String imageUrl;

  const UserModel({
    this.bio,
    this.coins,
    this.email,
    this.id,
    this.level,
    this.name,
    this.rank,
    this.imageUrl,
  });
}
