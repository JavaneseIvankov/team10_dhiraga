import 'package:flutter/material.dart';
import 'event_detail_page.dart';
import 'notification_page.dart'; // Halaman notifikasi event

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Event",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 44, 74, 221),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(218, 216, 219, 1),
              Color.fromARGB(255, 203, 176, 207),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Beasiswa Bulan Ini!"),
              _buildEventGrid(beasiswaList, context),
              const SizedBox(height: 20),
              _buildSectionTitle("Seminar dan Webinar"),
              _buildEventGrid(seminarList, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildEventGrid(
    List<Map<String, String>> events,
    BuildContext context,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.5,
      ),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return _buildEventCard(events[index], context);
      },
    );
  }

  Widget _buildEventCard(Map<String, String> event, BuildContext context) {
    return GestureDetector(
      onTap: () {
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
            image: const DecorationImage(
              image: AssetImage('assets/event_placeholder.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['title']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  event['date']!,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

List<Map<String, String>> seminarList = [
  {
    "title": "Strategi Jitu Lolos Beasiswa Djarum",
    "date": "1 Mei 2025 - 7 Mei 2025",
  },
  {
    "title": "Webinar Pelatihan Series - DPKA UB",
    "date": "1 Mar 2025 - 5 Mar 2025",
  },
  {
    "title": "Webinar Sosialisasi Pengenalan FT UB",
    "date": "1 Mar 2025 - 14 Mar 2025",
  },
  {
    "title": "Webinar Prodi Kimia UIN Malang",
    "date": "10 Mar 2025 - 18 Mar 2025",
  },
  {"title": "Webinar Karir - FIB UB", "date": "2 Mar 2025 - 5 Mar 2025"},
  {
    "title": "Kuliah Tamu Capstone Project - Filkom UB",
    "date": "1 Mar 2025 - 13 Mar 2025",
  },
];
