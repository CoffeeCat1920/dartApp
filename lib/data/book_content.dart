class BookContent {
  final String displayName;
  final String pdfName;

  BookContent({
    required this.displayName,
    required this.pdfName,
  });

  factory BookContent.fromJson(Map<String, dynamic> json) {
    return BookContent(
      displayName: json['display_name'],
      pdfName: json['pdf_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'display_name': displayName,
      'pdf_name': pdfName,
    };
  }
}
