class BookContent {
  final String displayName;
  final String folderName;

  BookContent({
    required this.displayName,
    required this.folderName,
  });

  factory BookContent.fromJson(Map<String, dynamic> json) {
    return BookContent(
      displayName: json['display_name'],
      folderName: json['folder_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'display_name': displayName,
      'folder_name': folderName,
    };
  }
}
