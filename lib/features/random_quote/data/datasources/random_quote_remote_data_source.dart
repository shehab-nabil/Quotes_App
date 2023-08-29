import 'package:quotes_app/core/api/api_consumer.dart';
import 'package:quotes_app/core/utils/api.dart';

import 'package:quotes_app/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl extends RandomQuoteRemoteDataSource {
  ApiConsumer apiConsumer;
  RandomQuoteRemoteDataSourceImpl({
    required this.apiConsumer,
  });
  @override
  Future<QuoteModel> getRandomQuote() async {
    final respose = await apiConsumer.get(Api.baseUrl);
    return QuoteModel.formJson(respose);
  }
}
