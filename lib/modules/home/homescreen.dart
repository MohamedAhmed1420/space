import 'package:flutter/material.dart';
import 'package:space/core/module/planet_model.dart';
import 'package:space/modules/widgets/title_widget.dart';

import '../decscretionscreen/descscreen.dart';
import '../widgets/cust_explore_bottom.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    pageController.addListener(listenOnPageChange);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void listenOnPageChange() {
    setState(() {
      currentPage = pageController.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           TitleWidget(
            title: "Explore",
            description: "Which planet\nwould you like to explore?",
          ),
          Expanded(
            child: PageView.builder(
              itemCount: Planet.planets.length,
              controller: pageController,
              itemBuilder: (context, index) =>
                  Image.asset(Planet.planets[index].pngImage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                  onPressed: () {
                    if (currentPage == 0) return;
                    pageController.animateToPage(
                      currentPage - 1, // تم تصحيح علامة الطرح هنا
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                const Spacer(),
                Text(
                  Planet.planets[currentPage].name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                  onPressed: () {
                    if (currentPage >= Planet.planets.length - 1) return; // تم تصحيحها هنا أيضاً
                    pageController.animateToPage(
                      currentPage + 1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          CustExploreBottom(
            text: "Explore ${Planet.planets[currentPage].name}",
            onPressed: () {
              Navigator.pushNamed(
                context,
                DescScreen.routeName,
                arguments: Planet.planets[currentPage],
              );
            },
          ),
        ],
      ),
    );
  }
}