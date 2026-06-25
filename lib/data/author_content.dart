class AuthorContent {
  final String displayName;
  final String folderName;

  AuthorContent({
    required this.displayName,
    required this.folderName,
  });

  factory AuthorContent.fromJson(Map<String, dynamic> json) {
    return AuthorContent(
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
