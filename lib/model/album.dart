
class Album {
  String? id;
  String? productUrl;
  String? coverPhotoBaseUrl;
  String? coverPhotoMediaItemId;
  String? mediaItemsCount;

  Album(String? id, String? productUrl, String? coverPhotoBaseUrl, String? coverPhotoMediaItemId, String? mediaItemsCount) {
    this.id = id;
    this.productUrl = productUrl;
    this.coverPhotoBaseUrl = coverPhotoMediaItemId;
    this.coverPhotoMediaItemId = coverPhotoMediaItemId;
    this.mediaItemsCount = mediaItemsCount;
  }

  factory Album.fromJson(Map<String, dynamic> json) =>
    Album(
      json['id'],
      json['productUrl'],
      json['coverPhotoBaseUrl'],
      json['coverPhotoMediaItemId'],
      json['mediaItemsCount'],
    );
}