import 'package:for_in_trip/src/BLoC_Ex/index.dart';

class YouAwesomeRepository {
  final YouAwesomeProvider _youAwesomeProvider = YouAwesomeProvider();

  YouAwesomeRepository();

  void test(bool isError) {
    _youAwesomeProvider.test(isError);
  }
}
