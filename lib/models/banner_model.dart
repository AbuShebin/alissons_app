class BannerModel {
  final int id;
  final String image;
  final String title;
  final String subtitle;
  
  BannerModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? 0,
        image = map['image'] ?? '',
        title = map['title'] ?? '',
        subtitle = map['subtitle'] ?? '';
}