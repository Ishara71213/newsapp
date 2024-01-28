import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/components/news_card.dart';
import 'package:newsapp/features/News/presentation/home_screen/bloc/cubit/home_cubit.dart';
import 'package:newsapp/features/News/presentation/home_screen/widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of<HomeCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: homeCubit.getAllPopularNews(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CarouselSlider(
                        items: snapshot.data!,
                        options: CarouselOptions(
                          height: 180,
                          //aspectRatio: 16 / 9,
                          viewportFraction: 0.9,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 16),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1200),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.2,
                          //onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        ));
                  } else {
                    return SizedBox(
                      height: size.height - 500,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      )),
                    );
                  }
                }),
            const SizedBox(height: 20),
            Column(
              children: [
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return FutureBuilder(
                        future: homeCubit.getAllNewsByCountry(context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              controller: scrollController,
                              // gridDelegate:
                              //     const SliverGridDelegateWithFixedCrossAxisCount(
                              //         crossAxisCount:
                              //             1, // number of items in each row
                              //         mainAxisSpacing:
                              //             0.0, // spacing between rows
                              //         crossAxisSpacing: 0.0,
                              //         childAspectRatio: 2.5
                              //         // spacing between columns
                              //         ),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return NewsCard(
                                    newsEntity: snapshot.data![index]);
                              },
                            );
                          } else {
                            return SizedBox(
                              height: size.height - 500,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.primary,
                              )),
                            );
                          }
                        });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
