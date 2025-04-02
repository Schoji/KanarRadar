import 'package:flutter/material.dart';
import 'package:kontrole/views/pages/welcome/get_started_page.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});

  final List<Map<String, String>> pages = [
    {
      "title": "Don't get caught off guard - be inspection-ready!",
      "lottie": "assets/lotties/ticket_check.json",
      "buttonLabel" : "Next",
    },
    {
      "title": "Get real-time updates on upcoming checks",
      "lottie": "assets/lotties/bus.json",
      "buttonLabel" : "Next",
    },
    {
      "title": "Share your inspections with others",
      "lottie": "assets/lotties/share.json",
      "buttonLabel" : "Next",
    },
  ];

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PageView.builder(
          controller: controller,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 10,
              children: [
                Text(
                  pages[index]["title"]!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Lottie.asset(pages[index]["lottie"]!, height: 300),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 50.0),
                  ),
                  onPressed: () {
                    if (index < pages.length - 1) {
                      controller.nextPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => GetstartedPage()),
                        (route) => false,
                      );
                    }
                  },

                  child: Text(pages[index]["buttonLabel"]!),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
