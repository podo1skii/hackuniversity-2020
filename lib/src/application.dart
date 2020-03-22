import 'package:bookshop/src/services/books_service.dart';
import 'package:bookshop/src/services/routing_service.dart';

import 'command_module.dart';

class Application {
  static final booksService = BooksService();
  static final routing = RoutingService();
  static final command = CommandModule();
}
