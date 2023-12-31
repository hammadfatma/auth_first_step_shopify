import 'package:auth_first_step_shopify/providers/ads_provider.dart';
import 'package:auth_first_step_shopify/providers/categories_provider.dart';
import 'package:auth_first_step_shopify/providers/products_provider.dart';
import 'package:auth_first_step_shopify/screens/product_details_screen.dart';
import 'package:auth_first_step_shopify/widgets/carousel_slider_widget.dart';
import 'package:auth_first_step_shopify/widgets/products_card_widget.dart';
import 'package:auth_first_step_shopify/widgets/row_categories_widget.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/icon_badge_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconBadgeWidget(
            txt: '5',
            con: Icons.maps_ugc_outlined,
            fl: true,
          ),
          IconBadgeWidget(
            txt: '10',
            con: Icons.notifications_none_outlined,
            fl: false,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(
                      0xff515c6f,
                    ),
                  ),
                ),
              ),
              Consumer<CategoriesProvider>(
                builder: (context, value, child) {
                  return FutureBuilder(
                    future: value.getCategories(context, limit: 3),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error While Get Data');
                        } else if (snapshot.hasData) {
                          return RowCategoriesWidget(
                              categories: snapshot.data ?? []);
                        } else {
                          return Text('No Data Found');
                        }
                      } else {
                        return Text(
                            'Connection Statue ${snapshot.connectionState}');
                      }
                    },
                  );
                },
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Latest',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(
                      0xff515c6f,
                    ),
                  ),
                ),
              ),
              Consumer<AdsProvider>(
                builder: (context, value, child) {
                  return FutureBuilder(
                    future: value.getAdvertisements(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error While Get Data');
                        } else if (snapshot.hasData) {
                          return CarouselSliderWidget(
                            advertisements: snapshot.data ?? [],
                          );
                        } else {
                          return Text('No Data Found');
                        }
                      } else {
                        return Text(
                            'Connection Statue ${snapshot.connectionState}');
                      }
                    },
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<ProductsProvider>(
                builder: (context, value, child) {
                  return FutureBuilder(
                    future: value.getProducts(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error While Get Data');
                        } else if (snapshot.hasData) {
                          return FlexibleGridView(
                              axisCount: GridLayoutEnum.threeElementsInRow,
                              shrinkWrap: true,
                              children: snapshot.data
                                      ?.map((item) => ProductWidget(
                                            product: item,
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailsPage(
                                                    product: item,
                                                  ),
                                                ),
                                              );
                                            },
                                          ))
                                      .toList() ??
                                  []);
                        } else {
                          return Text('No Data Found');
                        }
                      } else {
                        return Text(
                            'Connection Statue ${snapshot.connectionState}');
                      }
                    },
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<AuthProviderApp>(context, listen: false)
                      .signOut(context);
                },
                child: Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Color(0xffff6969),
          unselectedItemColor: Color(0xff515c6f),
          selectedIconTheme: IconThemeData(
            // color: Color(0xffff6969),
            size: 20,
          ),
          unselectedIconTheme: IconThemeData(
            // color: Color(0xff515c6f),
            size: 15,
          ),
          selectedLabelStyle: TextStyle(
            fontSize: 11,
            // color: Color(0xffff6969),
            letterSpacing: 0,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 11,
            letterSpacing: 0,
            // color: Color(0xff727c8e),
          ),
          backgroundColor: Color(0xffffffff),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outlined,
                ),
                label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_outlined,
                ),
                label: 'More'),
          ]),
    );
  }
}
