import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loclaization_app/generated/l10n.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale:const Locale('ar'),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      // for phone langueges
      localeResolutionCallback: (deviceLocal, supportedLocal) {
        for (var local in supportedLocal) {
          if (deviceLocal != null &&
              deviceLocal.languageCode == local.languageCode) {
            return deviceLocal;
          }
        }
        return supportedLocal.first;
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          S.of(context).title,
        ),
      ),
      body: Row(
        children: [
          Text(
            S.of(context).hello,
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: isArabic() ? 0 : 16,
              right: isArabic() ? 16 : 0,
            ),
            child: Text(
              S.of(context).name,
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: isArabic() ? 0 : 16,
              right: isArabic() ? 16 : 0,
            ),
            child: Text(
              S.of(context).name,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
