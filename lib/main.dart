import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smart_home/l10n/l10n.dart';
import 'package:smart_home/src/utils/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  //Set Default Language
  Intl.defaultLocale = 'en';
  //Error Handling
  FlutterError.onError = (details) {
    print(details);
    // print(details.exceptionAsString(), stackTrace: details.stack);
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Intl.defaultLocale!),
      onGenerateTitle: (context) => context.l10n.appTitle,
      theme: ThemeData(
        useMaterial3: true,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              buttonColor: const Color(0xFFF8F8FA),
            ),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xFFF8F8FA)),
              padding: MaterialStatePropertyAll(EdgeInsets.all(15))
              // padding: MaterialStatePropertyAll(EdgeInsets.all(15))
              // surfaceTintColor: MaterialStatePropertyAll(Color(0xFFD7D1D1)),
              // overlayColor: MaterialStatePropertyAll(Color(0xFFD7D1D1)),
              // shadowColor: MaterialStatePropertyAll(Color(0xFFD7D1D1)),
              // iconColor: MaterialStatePropertyAll(Color(0xFFD7D1D1)),
              ),
        ),
        colorScheme: const ColorScheme.light(
          background: Color(0xFFFFFFFF),
        ),
        primaryTextTheme: GoogleFonts.poppinsTextTheme()
            .copyWith(
              bodyLarge: GoogleFonts.poppins(),
              bodyMedium: GoogleFonts.poppins(),
              bodySmall: GoogleFonts.poppins(),
            )
            .apply(
              bodyColor: const Color(0xFF05050A),
              displayColor: const Color(0xFF05050A),
            ),
        textTheme: GoogleFonts.poppinsTextTheme()
            .copyWith(
              bodyLarge: GoogleFonts.poppins(),
              bodyMedium: GoogleFonts.poppins(),
              bodySmall: GoogleFonts.poppins(),
            )
            .apply(
              bodyColor: const Color(0xFF05050A),
              displayColor: const Color(0xFF05050A),
            ),
        drawerTheme: Theme.of(context).drawerTheme.copyWith(
              backgroundColor: Colors.white,
            ),
        // inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
        //   fillColor: const Color(0xFF1E2032),
        //   hintStyle: const TextStyle(color: Color(0xFF424A70)),
        //   iconColor: const Color(0xFF424A70),
        // ),
      ),
    );
  }
}
