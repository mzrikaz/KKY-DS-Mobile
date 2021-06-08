import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kky_ds/constants.dart';
import 'package:kky_ds/models/Event.dart' show EventsProvider;
import 'package:kky_ds/models/OrganizationalStructure.dart'
    show OrganizationalStructureProvider;
import 'package:kky_ds/models/RegisteredOrganization.dart';
import 'package:kky_ds/models/Service.dart' show ServicesProvider;
import 'package:kky_ds/models/ServiceDepartment.dart';
import 'package:kky_ds/models/Staff.dart' show StaffProvider;
import 'package:kky_ds/screens/home/home_page_screen.dart';
import 'package:provider/provider.dart';

import 'models/About.dart' show AboutProvider;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OrganizationalStructureProvider>(
          create: (_) => OrganizationalStructureProvider(),
        ),
        ChangeNotifierProvider<StaffProvider>(
          create: (_) => StaffProvider(),
        ),
        // Based on 'சேவைகள்' Sheet
        ChangeNotifierProvider<ServicesDepartmentsProvider>(
          create: (_) => ServicesDepartmentsProvider(),
        ),
        // Based on 'சேவைகள்' Sheet
        ChangeNotifierProvider<ServicesProvider>(
          create: (_) => ServicesProvider(),
        ),
        // Based on 'நிகழ்வுகள்' Sheet
        ChangeNotifierProvider<EventsProvider>(
          create: (_) => EventsProvider(),
        ),
        // Based on 'எம்மைப்பற்றி' Sheet
        ChangeNotifierProvider<AboutProvider>(
          create: (_) => AboutProvider(),
        ),
        ChangeNotifierProvider<RegisteredOrganizationProvider>(
          create: (_) => RegisteredOrganizationProvider(),
        ),
      ],
      child: MaterialApp(
        // We have used Catamaran is a tamil unicode font from google fonts
        // We're using this font because if a device doesn't support tamil font
        // then it will show squares or rectangles. in order to avoid this issue
        // We're using this font. font is located in 'assets/fonts/' directory.
        theme: ThemeData(
          fontFamily: 'Catamaran',
          // Colors are predefined in 'constants.dart' file
          primaryColor: kPrimaryColor,
          canvasColor: kTertiaryColor,
          accentColor: kSecondaryColor,
          primaryIconTheme: IconThemeData(color: kPrimaryTextColor),
        ),
        // Disabling debug banner on app bar
        debugShowCheckedModeBanner: false,
        routes: routes,
      ),
    );
  }

  // All the available routes are here

  Map<String, WidgetBuilder> get routes {
    return {
      HomePage.routeName: (ctx) => HomePage(),
    };
  }
}
