import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../consts/global_func.dart';
import '../../data/models/country_response.dart';
import 'info_card.dart';

Widget tabSection(CountryResp countryData, BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      children: [
        const TabBar(
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange,
          tabs: [
            Tab(icon: Icon(Icons.map_outlined), text: "Geography"),
            Tab(icon: Icon(Icons.business), text: "Economy"),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: TabBarView(
            children: [
              tabContentGeography(countryData, context),
              tabContentEconomy(countryData, context),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget tabContentGeography(CountryResp countryData, BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: const EdgeInsets.all(0),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: screenWidth / (screenHeight / 4.6),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        infoCard("Area", formatNumber(countryData.area!)),
        infoCard("LatLng", countryData.latlng!.toString()),
        infoCard("Capital LatLng", countryData.capitalInfo!.latlng!.toString()),
        infoCard("Subregion", countryData.subregion!),
        infoCard("Region", countryData.region!.toString()),
        infoCard("Continent", countryData.continents!.first),
      ],
    ),
  );
}

Widget tabContentEconomy(CountryResp countryData, BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: const EdgeInsets.all(0),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: screenWidth / (screenHeight / 4.6),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        infoCard("Population",  formatNumber(countryData.population!.toDouble())),
        infoCard("Land Locked?", countryData.landlocked!.toString()),
        infoCard("Drive Lane", countryData.car!.side!),
        infoCard("Start of Week", countryData.startOfWeek!),
      ],
    ),
  );
}

