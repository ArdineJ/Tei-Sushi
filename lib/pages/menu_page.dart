// ignore_for_file: depend_on_referenced_packages

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sushi/components/promo_box.dart';
import 'package:sushi/components/sushi_tile.dart';
import 'package:sushi/data/dummy_data.dart';
import 'package:sushi/models/promo.dart';

import '../models/sushi.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final PromoList promoList = PromoList();
  int myCurrentIndex = 0;

  late final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu_sharp,
          color: Colors.grey[900],
        ),
        title: Text(
          'Tokyo',
          style: GoogleFonts.lato(color: Colors.grey[900]),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: promoList.getPromoList().map((promo) {
                return PromoBox(
                  sushiImg: promo.sushiImg,
                  disc: promo.disc,
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                height: 200,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            AnimatedSmoothIndicator(
              activeIndex: myCurrentIndex,
              count: promoList.getPromoList().length,
              effect: SwapEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 5,
                dotColor: Colors.grey.shade400,
                activeDotColor: Colors.deepOrange,
                paintStyle: PaintingStyle.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Food Menu',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  AnimSearchBar(
                    textController: textController,
                    onSuffixTap: () {
                      setState(() {
                        textController.clear();
                      });
                    },
                    rtl: true,
                    onSubmitted: (String) {
                      // TODO
                    },
                    width: 300,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                height: 370,
                child: AnimationLimiter(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 15.0,
                      childAspectRatio: .7,
                    ),
                    itemBuilder: (context, index) {
                      Sushi sushi = DummyData.getSushiData()[index];
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        columnCount: 2,
                        duration: const Duration(milliseconds: 375),
                        child: ScaleAnimation(
                          curve: Curves.easeInOut,
                          // verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: SushiTile(
                              sushi: sushi,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/detailpage',
                                  arguments: sushi,
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: DummyData.getSushiData().length,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
