import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:package_info_plus/package_info_plus.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Future<PackageInfo> _packageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }

  @override
  Widget build(BuildContext context) {
    final routeData = RouteData.of(context);

    final logoPath = Theme.of(context).brightness == Brightness.light ? 'assets/images/logo.png' : 'assets/images/logo_dk.png';

    return Scaffold(
      appBar: AppBar(
        title: Text(routeData.title(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                logoPath,
                width: 128.0,
              ),
              const SizedBox(height: 8.0),
              FutureBuilder<PackageInfo>(
                future: _packageInfo(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return const Text('Błąd ładowania danych aplikacji');
                  }

                  final packageInfo = snapshot.data!;

                  List<String> appInfo = [
                    'Nazwa aplikacji: ${packageInfo.appName}',
                    'Wersja: ${packageInfo.version}+${packageInfo.buildNumber}',
                  ];

                  return Text(
                    appInfo.join('\n'),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
