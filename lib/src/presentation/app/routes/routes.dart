import 'package:flutter/material.dart';

import '../../common/page/message_page.dart';
import '../../feature/fibonacci/fibonacci_page.dart';

/// Routes management class.
///
/// Uses static const variables to enumerate available routes and implements
/// onGenerateRoute callback used for named routes navigation.
class Routes {
  /// Const constructor.
  const Routes();

  /// Static routes.
  static const home = '/';

  /// Callback for MaterialApp.
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _route((_) => const FibonacciPage());
      default:
        return _route(
          (_) => MessagePage.error('Unknown route "${settings.name}"'),
        );
    }
  }

  Route _route(Widget Function(BuildContext context) builder) => MaterialPageRoute(builder: builder);

  // ignore: unused_element
  Route _routeWithArg<T>(Object? arg, Widget Function(BuildContext, T) builder) => MaterialPageRoute(
        builder: (context) => _argumentBuilder<T>(context, arg, builder),
      );

  Widget _argumentBuilder<T>(BuildContext context, Object? arg, Widget Function(BuildContext, T) builder) =>
      arg is T ? builder(context, arg) : MessagePage.error('Illegal argument for route');
}
