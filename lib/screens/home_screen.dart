import 'package:auth_first_step_shopify/providers/home_provider.dart';
import 'package:auth_first_step_shopify/widgets/carousel_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/categories_circle_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context,value,child){
      return Scaffold(
        appBar: AppBar(),
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
                CategoriesCircleWidget(),
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
                CarouselSliderWidget(),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<AuthProviderApp>(context,listen: false).signOut(context);
                  },
                  child: Text('Log Out'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
