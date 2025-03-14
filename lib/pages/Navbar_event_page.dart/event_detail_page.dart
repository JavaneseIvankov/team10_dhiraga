import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  final Map<String, String> event;

  EventDetailPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event['title']!, style: TextStyle(color: Colors.white)),
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
              Color.fromARGB(255, 232, 231, 233), // Ungu tua
              Color.fromARGB(255, 227, 197, 231), // Ungu muda
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul Event
              Text(
                event['title']!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 10, 10, 10),
                ),
              ),
              SizedBox(height: 10),
              // Tanggal Event
              Text(
                event['date']!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 20),

              // Informasi ASTRA
              Text(
                "**ASTRA**",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "- **S1**\n- **Universitas Indonesia (dan 37 lainnya)**",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),

              // Manfaat
              Text(
                "Manfaat",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "- Fully Funded\n- Bantuan biaya pendidikan / UKT\n- Menjadi Ambassador Astra\n- Berkontribusi langsung dengan memberikan solusi dan strategi dalam Real Project Astra",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),

              // Persyaratan
              Text(
                "Persyaratan",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "- Mahasiswa S1 yang sedang menempuh semester 4 & 6, memiliki IPK > 3,00\n- Memiliki prestasi non akademik, pengalaman organisasi, komunitas, ataupun magang\n- Tidak sedang menerima beasiswa dari pihak lain (Periode Juni - November 2025)\n- Bersedia menjadi Astra Ambassador dan mendukung kegiatan Astra di dalam maupun luar kampus",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),

              // Lampiran (Placeholder untuk Link)
              Text(
                "Lampiran",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              _buildLinkPlaceholder("Link Panduan"),
              _buildLinkPlaceholder("Link Template"),
              SizedBox(height: 20),

              // Kotak untuk Link Pendaftaran (Placeholder)
              _buildLinkPlaceholder("Link Pendaftaran"),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk membuat placeholder link
  Widget _buildLinkPlaceholder(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}
