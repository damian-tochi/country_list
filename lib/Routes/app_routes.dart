import 'package:african_countries/routes/pages_name.dart';
import 'package:african_countries/ui/country_list.dart';
import 'package:african_countries/ui/start.dart';
import 'package:go_router/go_router.dart';

import '../data/models/countries_list_response.dart';
import '../ui/detail.dart';
import 'go_router_transition.dart';


final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: PageName.SplashRoute,
      pageBuilder: (context, state) => fadeTransitionPage(
        context,
        state,
        const StartPage(),
      ),
      routes: [
        GoRoute(
          name: PageName.Home,
          path: PageName.HomeRoute,
          pageBuilder: (context, state) => fadeTransitionPage(
            context,
            state,
            CountryListScreen(),
          ),
          routes: [
            GoRoute(
              name: PageName.Detail,
              path: PageName.DetailRoute,
              pageBuilder: (context, state) {
                CountriesListResponse name = state.extra as CountriesListResponse;
                return fadeTransitionPage(
                  context,
                  state,
                  DetailScreen(name),
                );
              },
            ),
          ],
        ),
      ]
    ),

  ],
);


