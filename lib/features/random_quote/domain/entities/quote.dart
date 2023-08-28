import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String id;
  final String content;
  final String author;

  const Quote({required this.id, required this.content, required this.author});

  @override
  List<Object> get props => [id, content, author];
}
