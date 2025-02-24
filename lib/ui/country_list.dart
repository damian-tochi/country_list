import 'package:african_countries/consts/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_animated_buttons/widgets/pretty_wave_button.dart';
import '../consts/global_func.dart';
import '../consts/values.dart';
import '../data/cubits/countries_list_cubit.dart';
import '../data/helpers/api_state.dart';
import '../routes/pages_name.dart';
import 'components/cached_image.dart';
import 'components/network_failure.dart';
import 'components/network_loader.dart';
import 'components/search_widget.dart';
import 'components/width.dart';


class CountryListScreen extends StatefulWidget {
  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  bool isGridView = false;
  final TextEditingController searchInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final appCubit = BlocProvider.of<CountriesListCubit>(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<CountriesListCubit, ApiState>(
          listener: (context, state) {
            setState(() {});
          },
        ),
      ],
      child: BlocBuilder<CountriesListCubit, ApiState>(builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              body: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: screenHeight / 12, left: 5, right: 20, bottom: 20),
                    child: IntrinsicHeight(
                      child: Stack(
                        children: [
                          const Align(
                            child: Text(
                              "Countries List",
                              textAlign: TextAlign.center,
                              style: TextStyle(
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
                                width: 25.0,
                                height: 25.0,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  isGridView = !isGridView;
                                });
                              },
                              icon: SvgPicture.asset(
                                isGridView
                                    ? AppIcons.filterSymbolActive
                                    : AppIcons.filterSymbol,
                                width: 20.0,
                                height: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: SearchWidget(
                    searchInputController: searchInputController,
                    onTextChange: (string) {
                      appCubit.filterItems(string);
                    },
                  ),),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child:
                              ScaleTransition(scale: animation, child: child),
                        );
                      },
                      child: isGridView ? buildGridView() : buildListView(),
                    ),
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
      }),
    );
  }

  Widget buildListView() {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<CountriesListCubit, ApiState>(
      builder: (context, state) {
        if (state is ApiResult) {
          return ListView.builder(
            key: const ValueKey(1),
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              var item = state.items[index];
              return ExpansionTile(
                title: Row(
                  children: [
                    width(10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: CachedImage(
                        imageUrl: item.flags!.png!,
                        height: screenWidth / 12,
                        width: screenWidth / 12,
                        radius: screenWidth / 8,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: screenWidth / 15),
                    Expanded(
                      child: Text(
                        item.name!.official!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: normalTextSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width(10)
                  ],
                ),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      width(15),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Capital',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: smallTextSize,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                      const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.capital!.first,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: smallTextSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                      width(15),
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      width(15),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Languages',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: smallTextSize,
                            fontWeight: FontWeight.normal),
                      ),
                    ),

                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(languages(item.languages!),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: smallTextSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                      width(15),
                  ],),
                  height(5),
                  PrettyWaveButton(
                    verticalPadding: 8,
                    horizontalPadding: 80,
                    backgroundColor: Colors.orange,
                    child: const Text(
                      'See more',
                      style: TextStyle(
                          fontFamily: 'Paradroid',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: smallTextSize),
                    ),
                    onPressed: () {
                      context.go("${PageName.HomeRoute}/${PageName.DetailRoute}",
                          extra: item);
                    },
                  ),
                  height(9),
                ],
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildGridView() {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<CountriesListCubit, ApiState>(
      builder: (context, state) {
        if (state is ApiResult) {
          return GridView.builder(
            key: const ValueKey(2),
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 15,
              mainAxisSpacing: 25,
              childAspectRatio: 1.5,
            ),
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      context.go(
                          "${PageName.HomeRoute}/${PageName.DetailRoute}",
                          extra: state.items[index]);
                    },
                    icon: CachedImage(
                      imageUrl: state.items[index].flags!.png!,
                      fit: BoxFit.fill,
                      radius: screenWidth / 3,
                      height: screenWidth / 3,
                      width: screenWidth / 3,
                    ),
                  )
                ],
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
