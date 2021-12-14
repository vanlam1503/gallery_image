
class MediaItem {
  String? id;
  String? productUrl;
  String? baseUrl;

  MediaItem(this.id, this.productUrl, this.baseUrl);

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
    MediaItem(
        json['id'],
        json['productUrl'],
        json['baseUrl']
    );
}