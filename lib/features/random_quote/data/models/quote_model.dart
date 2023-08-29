import 'package:quotes_app/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required super.id, required super.content, required super.author});

  factory QuoteModel.formJson(Map<String, dynamic> json) => QuoteModel(
      id: json['_id'], content: json['content'], author: json['author']);
  Map<String, dynamic> toJson() => {
        "author": author,
        "_id": id,
        "quote": content,
      };
}
