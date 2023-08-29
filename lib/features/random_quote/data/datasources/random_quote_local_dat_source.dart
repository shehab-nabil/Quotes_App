import 'dart:convert';

import 'package:quotes_app/core/error/exceptions.dart';
import 'package:quotes_app/core/utils/app_strings.dart';
import 'package:quotes_app/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cashQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cashQuote(QuoteModel quote) {
    return sharedPreferences.setString(
        AppStrings.cachedRandomQuoteKey, json.encode(quote));
  }

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuoteKey);
    if (jsonString != null) {
      final cachedRandomQuote =
          Future.value(QuoteModel.formJson(json.decode(jsonString)));
      return cachedRandomQuote;
    } else {
      throw LocalException();
    }
  }
}
