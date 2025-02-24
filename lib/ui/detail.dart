import 'package:african_countries/Theme/colors.dart';
import 'package:african_countries/consts/global_func.dart';
import 'package:african_countries/data/cubits/country_detail_cubit.dart';
import 'package:african_countries/ui/components/width.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../consts/app_icons.dart';
import '../consts/values.dart';
import '../data/helpers/api_state.dart';
import '../data/models/countries_list_response.dart';
import 'components/cached_image.dart';
import 'components/info_card.dart';
import 'components/network_failure.dart';
import 'components/network_loader.dart';
import 'components/tab_card.dart';

class DetailScreen extends StatefulWidget {
  final CountriesListResponse country;

  const DetailScreen(this.country, {super.key});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    context
        .read<CountryDetailCubit>()
        .getCountry(widget.country.name!.official!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth ~/ 150).clamp(2, 4);

    return BlocListener<CountryDetailCubit, ApiState>(
      listener: (context, state) {
        setState(() {});
      },
      child: BlocBuilder<CountryDetailCubit, ApiState>(
        builder: (context, state) {
          return Stack(
            children: [
              if (state is ApiCountryResult)
                Scaffold(
                  body: Stack(
                    children: [
                      Positioned(
                        top: -50,
                        left: -50,
                        child: CachedImage(
                          imageUrl: state.result[0].flags!.png!,
                          height: screenWidth / 2,
                          width: screenWidth / 2,
                          radius: 800,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: -50,
                        right: -50,
                        child: CachedImage(
                          imageUrl: state.result[0].flags!.png!,
                          height: screenWidth / 1.2,
                          width: screenWidth / 1.2,
                          radius: 800,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: CustomTheme.transparentBlacker,
                      ),
                      Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: CustomTheme.transparentBlacker,
                      ),
                      Container(
                        width: screenWidth,
                        height: screenHeight,
                        color: CustomTheme.transparentBlacker,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: screenHeight / 12,
                                left: 5,
                                right: 20,
                                bottom: 20),
                            child: IntrinsicHeight(
                              child: Stack(
                                children: [
                                  Align(
                                    child: Text(
                                      state.result[0].name!.official!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: largeTextSize,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: SvgPicture.asset(
                                        AppIcons.arrowRight,
                                        width: 30.0,
                                        height: 25.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: CustomScrollView(
                              slivers: [
                                SliverAppBar(
                                  floating: false,
                                  expandedHeight: screenHeight / 4.5,
                                  automaticallyImplyLeading: false,
                                  pinned: true,
                                  backgroundColor: Colors.transparent,
                                  flexibleSpace: FlexibleSpaceBar(
                                    background: CachedImage(
                                      imageUrl: state.result[0].flags!.png!,
                                      width: screenWidth,
                                      radius: 0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SliverList(
                                  delegate: SliverChildListDelegate([
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          height(10),
                                          const Text("Basic Information",
                                              style: TextStyle(
                                                fontSize: largeTextSize,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )),
                                          GridView.count(
                                            crossAxisCount: crossAxisCount,
                                            crossAxisSpacing: 8,
                                            mainAxisSpacing: 8,
                                            childAspectRatio: screenWidth / (screenHeight / 4.6),
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            children: [
                                              infoCard(
                                                  "Capital",
                                                  state.result[0].capital!
                                                      .first),
                                              infoCard(
                                                  "Population",
                                                  formatNumber(state
                                                      .result[0].population!
                                                      .toDouble())),
                                              infoCard(
                                                  "Language",
                                                  languages(state
                                                      .result[0].languages!)),
                                              infoCard(
                                                  "Timezone",
                                                  state.result[0].timezones!
                                                      .first),
                                              infoCard("Flag",
                                                  state.result[0].flag!),
                                              infoCard("Fifa",
                                                  state.result[0].fifa!),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          tabSection(state.result[0], context),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              if (state is ApiLoading) const NetworkLoader(),
              if (state is ApiFailure)
                NetworkFailure(msg: state.failure,),
              if (state is ApiError)
                NetworkFailure(msg: state.error,),
            ],
          );
        },
      ),
    );
  }
}
