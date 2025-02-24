import 'package:african_countries/consts/app_icons.dart';
import 'package:african_countries/consts/values.dart';
import 'package:african_countries/data/cubits/countries_list_cubit.dart';
import 'package:african_countries/ui/components/app_info_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_animated_buttons/widgets/pretty_wave_button.dart';
import '../routes/pages_name.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StartPage> {


  @override
  void initState() {
    context.read<CountriesListCubit>().getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
            top: screenHeight / 12, left: 5, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    const Align(
                      child: Text("African Countries",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: largeTextSize,
                              fontWeight: FontWeight.bold),),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        padding: const EdgeInsets.all(3),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AppInfoDialog();
                            },
                          );
                        },
                        icon: SvgPicture.asset(
                          AppIcons.infoCircle,
                          width: 40.0,
                          height: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(
              flex: 1,
            ),

            Image.asset(
              AppIcons.africaFlags,
              width: screenWidth / 1.5,
              height: screenHeight / 3,
              fit: BoxFit.contain,
            ),

            const Spacer(
              flex: 1,
            ),

            PrettyWaveButton(
              verticalPadding: 12,
              horizontalPadding: 90,
              backgroundColor: Colors.orange,
              child: const Text(
                'Start',
                style: TextStyle(
                    fontFamily: 'Paradroid',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: normalTextSize),
              ),
              onPressed: () {
                //context.replace(PageName.HomeRoute);
                context.go('${PageName.SplashRoute}/${PageName.HomeRoute}');
              },
            ),

            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
