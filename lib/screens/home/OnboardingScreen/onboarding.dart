import 'package:ecosia/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: TextStyle(
              color: Colors.green[700],
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/reduce.png',
              title: 'REDUCE',
              subtitle:
              'The Best Waste is None.\nUse less. Buy less.\nAvoid waste. Carpool\nTurn off lights take shorter showers.',
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/recycle.png',
              title: 'RECYCLE',
              subtitle:
              'Use things more than once.\nUse cloth shopping bags.\nRepair. Regift. Compost.\nTry travel mugs.',
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/reuse.png',
              title: 'REUSE',
              subtitle:
              'Donate old garments.\nSeparate waste materials so that\nrecyclable products can be\ntransformed into something new!',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            primary: Colors.white,
            backgroundColor: Colors.green.shade700,
            minimumSize: const Size.fromHeight(80),
          ),
          onPressed: () async {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Wrapper()));
          },
          child: const Text('Get Started',
              style: TextStyle(
                fontSize: 24,
              )))
          : Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => controller.jumpToPage(2),
              child: Text(
                'SKIP',
                style: TextStyle(color: Colors.green[700], fontSize: 18),
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.green.shade700,
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  curve: Curves.easeIn,
                ),
              ),
            ),
            TextButton(
              onPressed: () => controller.nextPage(
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  curve: Curves.easeInOut),
              child: Text(
                'NEXT',
                style: TextStyle(color: Colors.green[700], fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}