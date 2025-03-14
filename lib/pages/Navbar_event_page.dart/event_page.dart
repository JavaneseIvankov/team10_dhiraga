import 'package:flutter/material.dart';
import 'event_detail_page.dart'; // Import halaman detail

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Event",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 44, 74, 221),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(218, 216, 219, 1), // Ungu tua
              Color.fromARGB(255, 203, 176, 207), // Ungu muda
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Beasiswa Bulan Ini!"),
              _buildEventGrid(beasiswaList, context),
              SizedBox(height: 20),
              _buildSectionTitle("Seminar dan Webinar"),
              _buildEventGrid(seminarList, context),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk judul section
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // Widget untuk menampilkan grid event
  Widget _buildEventGrid(
    List<Map<String, String>> events,
    BuildContext context,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 kolom
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1, // Kotak persegi
      ),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return _buildEventCard(events[index], context);
      },
    );
  }

  // Widget untuk card event
  Widget _buildEventCard(Map<String, String> event, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail event
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailPage(event: event),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF7E57C2), // Ungu muda
                Color(0xFF512DA8), // Ungu tua
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['title']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  event['date']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Data dummy untuk beasiswa
List<Map<String, String>> beasiswaList = [
  {
    "title": "Beasiswa Penelitian Bank Indonesia",
    "date": "1 Feb 2025 - 31 Okt 2025",
  },
  {
    "title": "Beasiswa Bintang Glow and Lovely",
    "date": "3 Feb 2025 - 8 Mei 2025",
  },
  {"title": "Beasiswa ASTRA 2025", "date": "13 Feb 2025 - 30 Apr 2025"},
  {"title": "Beasiswa Karya Salemba Empat", "date": "24 Feb 2025 - 4 Apr 2025"},
  {"title": "Beasiswa Djarum Plus 2025", "date": "27 Mar 2025 - 30 Mei 2025"},
];

// Data dummy untuk seminar dan webinar
List<Map<String, String>> seminarList = [
  {
    "title": "Strategi Jitu Lolos Beasiswa Djarum",
    "date": "1 Mei 2025 - 7 Mei 2025",
  },
  {
    "title": "Beasiswa Bank Indonesia : Tips & Trik",
    "date": "10 Mei 2025 - 20 Mei 2025",
  },
  {
    "title": "Raih Beasiswa Astra, Persiapkan Masa Depan",
    "date": "20 Mei 2025 - 3 Juni 2025",
  },
  {
    "title": "Strategi Beasiswa Unggulan Kemendikbud",
    "date": "1 Jun 2025 - 12 Jun 2025",
  },
  {
    "title": "Beasiswa Gojek : Kuliah, Karir Cemerlang",
    "date": "1 Sep 2025 - 10 Sep 2025",
  },
  {
    "title": "Kuliah Gratis dengan Beasiswa Kominfo",
    "date": "5 Sep 2025 - 18 Sep 2025",
  },
];
