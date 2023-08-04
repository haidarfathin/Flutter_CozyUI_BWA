import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/models/City.dart';
import 'package:cozy_app/models/tips.dart';
import 'package:cozy_app/providers/space_provider.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widgets/bottom_navbar_item.dart';
import 'package:cozy_app/widgets/city_card.dart';
import 'package:cozy_app/widgets/space_card.dart';
import 'package:cozy_app/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          //note: title/header
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Mencari kost yang nyaman buat kamu',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //note: popular cities
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Popular cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/city1.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/city2.png',
                      isPopular: true)),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Semarang',
                      imageUrl: 'assets/city3.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 4,
                      name: 'Bogor',
                      imageUrl: 'assets/city5.png',
                      isPopular: true)),
                    SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 5,
                      name: 'Palembang',
                      imageUrl: 'assets/city6.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 6,
                      name: 'Aceh',
                      imageUrl: 'assets/city4.png',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // note: recomennded spaces
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //Note: Tips&Guidance
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(Tips(
                    id: 1,
                    title: 'City Guideline',
                    imageUrl: 'assets/tips1.png',
                    updatedAt: '20 Apr',
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(Tips(
                    id: 2,
                    title: 'Jakarta Fairship',
                    imageUrl: 'assets/tips2.png',
                    updatedAt: '11 Dec',
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbar(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavbar(
              imageUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavbar(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbar(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
