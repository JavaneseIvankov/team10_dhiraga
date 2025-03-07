import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'event_page.dart';
import 'mentoring_page.dart';
import 'profile_page.dart';
import 'login_page.dart';
import 'notification_page.dart';
import 'beasiswa_page.dart';
import 'mentor_page.dart';
import 'template_page.dart' as tpl;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String username = "";
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    user = _auth.currentUser;
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      DocumentSnapshot userData =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get();
      setState(() {
        username = userData["username"] ?? "Pengguna";
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeContent(),
    EventPage(),
    MentoringPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          if (_selectedIndex == 0)
            Positioned(
              top: 40,
              right: 16,
              child: IconButton(
                icon: Icon(
                  Icons.bookmark, // Menggunakan ikon bookmark seperti di gambar
                  color: Colors.blue.shade900,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Event'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Mentoring'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ayo temukan peluang terbaik untukmu!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Temukan mentor, beasiswa, atau template",
                prefixIcon: Icon(Icons.search, color: Colors.blue.shade900),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildSection(
              "Beasiswa Populer",
              'beasiswa',
              context,
              BeasiswaPage(),
            ),
            _buildSection("Mentor Populer", 'mentors', context, MentorPage()),
            _buildSection(
              "Template Gratis",
              'templates',
              context,
              tpl.TemplatePage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    String title,
    String collection,
    BuildContext context,
    Widget nextPage,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => nextPage),
                );
              },
              child: Text(
                "Lihat lainnya",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection(collection).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Text("Belum ada data tersedia.");
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    snapshot.data!.docs.map((doc) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => nextPage),
                          );
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doc['nama'] ?? "",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                doc['deskripsi'] ?? "",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
              ),
            );
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
