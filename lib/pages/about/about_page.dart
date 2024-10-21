import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeData = RouteData.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(routeData.title(context)),
      ),
    );
  }
}
