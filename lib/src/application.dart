import 'package:bookshop/src/services/books_service.dart';
import 'package:bookshop/src/services/routing_service.dart';

class Application {
  static final booksService = BooksService();
  static final routing = RoutingService();
}
