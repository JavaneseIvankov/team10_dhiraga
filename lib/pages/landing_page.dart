import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team10_dhiraga/main.dart'; // Import untuk navigasi ke AuthWrapper

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> landingData = [
    {
      "title": "Selamat Datang di Dhiraga!",
      "subtitle": "Platform Beasiswa & Mentoring Terbaik",
    },
    {
      "title": "Temukan Beasiswa Terbaik",
      "subtitle":
          "Dhiraga hadir untuk mempermudah perjalananmu mendapatkan beasiswa, dengan bimbingan langsung dari mentor awardee beasiswa!",
    },
    {
      "title": "Tingkatkan Performa Akademik",
      "subtitle":
          "Kesulitan memahami materi sekolah maupun kuliah? Dapatkan bimbingan akademik dari mentor berpengalaman!",
    },
  ];

  Future<void> _finishLandingPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenLanding', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AuthWrapper(),
      ), // Ke HomePage/Login
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: landingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return LandingPageContent(
                  title: landingData[index]["title"]!,
                  subtitle: landingData[index]["subtitle"]!,
                  isLastPage: index == landingData.length - 1,
                  onFinish: _finishLandingPage,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              landingData.length,
              (index) => buildDot(index, context),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 12 : 8,
      height: _currentPage == index ? 12 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue.shade900 : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class LandingPageContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isLastPage;
  final VoidCallback? onFinish;

  LandingPageContent({
    required this.title,
    required this.subtitle,
    this.isLastPage = false,
    this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.blue.shade50],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/apple_icon.png', height: 120),
          SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          SizedBox(height: 40),
          if (isLastPage)
            ElevatedButton(
              onPressed: onFinish,
              child: Text("Mulai"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue.shade900,
                foregroundColor: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
