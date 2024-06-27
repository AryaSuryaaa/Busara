import 'dart:convert';

import 'package:busara/model/Provinces.dart';
import 'package:busara/ui/detail_page.dart';
import 'package:busara/widget/budaya_card.dart';
import 'package:busara/widget/platform_widget.dart';
import 'package:busara/widget/province_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'images/banner.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            FutureBuilder<String>(
              future: DefaultAssetBundle.of(context).loadString('assets/provinces.json'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available'));
                } else {
                  Provinces provinces = Provinces.fromJson(snapshot.data!);
                  return Column(
                    children: [
                      Container(
                        transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0, 3),
                                      blurRadius: 64,
                                    )
                                  ],
                                  borderRadius:BorderRadiusDirectional.circular(40)
                              ),
                              child: const ListTile(
                                title: Text("Cari kebudayaan Indonesia"),
                                trailing: Icon(Icons.search),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Provinsi",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: null,
                                      child: Text("Lihat Semua")
                                  )
                                ],
                              ),
                            ),
                            Container(
                              // margin: EdgeInsets.only(left: 8),
                              height: 151,
                              child:
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: provinces.provinces.length,
                                itemBuilder: (context, index) {
                                  EdgeInsetsGeometry margin = const EdgeInsets.only(left: 0);
                                  if (index == 0) {
                                    // Margin for the first item
                                    margin = const EdgeInsets.only(left: 16);
                                  } else if (index == provinces.provinces.length - 1) {
                                    // Margin for the last item
                                    margin = const EdgeInsets.only(left: 8, right:16);
                                  } else {
                                    margin = const EdgeInsets.only(left: 8);
                                  }
                                  return Container(
                                    margin: margin,
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        //   // return DetailScreen(list: list);
                                        // }));
                                      },
                                      child: ProvinceCard(
                                        provinceName: provinces.provinces[index].provinceName,
                                        imagePath: provinces.provinces[index].provinceImage,
                                      )
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rumah Adat",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: null,
                                      child: Text("Lihat Semua")
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 190,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: provinces.provinces.length,
                                itemBuilder: (context, index) {
                                  EdgeInsetsGeometry margin = const EdgeInsets.only(left: 0);
                                  if (index == 0) {
                                    // Margin for the first item
                                    margin = const EdgeInsets.only(left: 16,bottom: 10);
                                  } else if (index == provinces.provinces.length - 1) {
                                    // Margin for the last item
                                    margin = const EdgeInsets.only(left: 8, right:16, bottom: 10);
                                  } else {
                                    margin = const EdgeInsets.only(left: 8, bottom: 10);
                                  }
                                  final traditionalHouses = provinces.provinces[index].culturalHeritage.traditionalHouses;
                                  return Row(
                                    children: traditionalHouses.map((house) {
                                      return Container(
                                        margin: margin,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return DetailPage(detail: house.details,);
                                            }));
                                          },
                                          child: BudayaCard(
                                            title: house.title,
                                            subTitle: house.subText,
                                            imagePath: house.image,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tari",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: null,
                                      child: Text("Lihat Semua")
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 190,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: provinces.provinces.length,
                                itemBuilder: (context, index) {
                                  EdgeInsetsGeometry margin = const EdgeInsets.only(left: 0);
                                  if (index == 0) {
                                    // Margin for the first item
                                    margin = const EdgeInsets.only(left: 16,bottom: 10);
                                  } else if (index == provinces.provinces.length - 1) {
                                    // Margin for the last item
                                    margin = const EdgeInsets.only(left: 8, right:16, bottom: 10);
                                  } else {
                                    margin = const EdgeInsets.only(left: 8, bottom: 10);
                                  }
                                  final traditionalDances = provinces.provinces[index].culturalHeritage.traditionalDances;
                                  return Row(
                                    children: traditionalDances.map((dance) {
                                      return Container(
                                        margin: margin,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return DetailPage(detail: dance.details);
                                            }));
                                          },
                                          child: BudayaCard(
                                            title: dance.title,
                                            subTitle: dance.subText,
                                            imagePath: dance.image,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Artikel",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: null,
                                      child: Text("Lihat Semua")
                                  )
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "coming soon",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('News App'),
        transitionBetweenRoutes: false,
      ),
      child: Column(
        children: [
          Image.asset('images/banner.png')
        ],
      ),
    );
    }
}

