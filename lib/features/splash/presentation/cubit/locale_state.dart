part of 'locale_cubit.dart';

abstract class LocaleState extends Equatable {
  final Locale local;
  const LocaleState(this.local);

  @override
  List<Object> get props => [local];
}

final class ChangeLocaleState extends LocaleState {
  const ChangeLocaleState(Locale selectedLocale) : super(selectedLocale);
}
