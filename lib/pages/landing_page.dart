import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team10_dhiraga/main.dart'; // Pastikan ini mengarah ke AuthWrapper

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer; // Menggunakan nullable Timer

  List<Map<String, String>> landingData = [
    {
      "title": "Selamat Datang di Dhiraga!",
      "subtitle": "Platform Beasiswa & Mentoring Terbaik",
    },
    {
      "title": "Temukan Beasiswa Terbaik",
      "subtitle":
          "Dhiraga hadir untuk mempermudah perjalananmu mendapatkan beasiswa!",
    },
    {
      "title": "Tingkatkan Performa Akademik",
      "subtitle": "Dapatkan bimbingan akademik dari mentor berpengalaman!",
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < landingData.length - 1) {
        if (mounted) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      } else {
        _finishLandingPage();
        timer.cancel();
      }
    });
  }

  Future<void> _finishLandingPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenLanding', true);

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthWrapper()),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cek null sebelum cancel
    _pageController.dispose();
    super.dispose();
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
                if (mounted) {
                  setState(() {
                    _currentPage = index;
                  });
                }
              },
              itemBuilder: (context, index) {
                return LandingPageContent(
                  title: landingData[index]["title"]!,
                  subtitle: landingData[index]["subtitle"]!,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              landingData.length,
              (index) => buildDot(index),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
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

  const LandingPageContent({required this.title, required this.subtitle});

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
        ],
      ),
    );
  }
}
