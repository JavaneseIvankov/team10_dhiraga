import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart'; // Import halaman login
import 'register_page.dart'; // Import halaman register

void main() {
  runApp(MaterialApp(home: LoadingPage()));
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(child: Image.asset('assets/logo.png', height: 120)),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onLoginPress(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasSeenLandingPage', true);
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  void _onRegisterPress(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasSeenLandingPage', true);
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  List<Map<String, String>> landingData = [
    {
      "title": "Selamat Datang di Dhiraga!",
      "subtitle": "Platform pencarian Beasiswa & Mentoring Terbaik",
    },
    {
      "title": "Temukan Beasiswa Terbaik",
      "subtitle":
          "Dhiraga hadir untuk mempermudah perjalananmu mendapatkan beasiswa!",
    },
    {
      "title": "Tingkatkan Performa Akademik",
      "subtitle":
          "Kesulitan memahami materi sekolah maupun kuliah? Dapatkan bimbingan terbaik dari mentor berpengalaman!",
    },
  ];

  void _nextPage() {
    if (_currentPage < landingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
                _currentPage == landingData.length - 1
                    ? Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _onLoginPress(context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => LoginPage(),
                            //   ),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade900,
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            _onRegisterPress(context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => RegisterPage(),
                            //   ),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.purple),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    )
                    : ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        'Selanjutnya',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
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

  const LandingPageContent({
    super.key,
    required this.title,
    required this.subtitle,
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
          Image.asset('assets/logo.png', height: 120),
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
