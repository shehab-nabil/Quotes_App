// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes_app/core/error/exceptions.dart';
import 'package:quotes_app/core/utils/api.dart';

import 'package:quotes_app/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl extends RandomQuoteRemoteDataSource {
  http.Client client;
  RandomQuoteRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<QuoteModel> getRandomQuote() async {
    final respose = await client.get(
      Uri.parse(Api.baseUrl),
    );
    if (respose.statusCode == 200) {
      return QuoteModel.formJson(json.decode(respose.body));
    } else {
      throw ServerException();
    }
  }
}
