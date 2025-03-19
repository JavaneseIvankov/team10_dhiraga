import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  final Map<String, String> event;

  EventDetailPage({required this.event});

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  bool isNotificationSaved = false;

  void _toggleNotification() {
    setState(() {
      isNotificationSaved = !isNotificationSaved;
    });

    if (isNotificationSaved) {
      _showNotificationDialog();
    }
  }

  void _showNotificationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.thumb_up, size: 50, color: Colors.blue),
              SizedBox(height: 10),
              Text(
                "Notifikasi telah disimpan!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                "Tetap semangat dan terus berkembang bersama Dhiraga!",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Kembali"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.event['title']!,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/event_placeholder.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),

            _buildInfoBox("Informasi Event", [
              "Nama: ${widget.event['title']}",
              "Tanggal: ${widget.event['date']}",
            ]),

            _buildInfoBox("Manfaat", [
              "Fully Funded",
              "Bantuan biaya pendidikan / UKT",
              "Menjadi Ambassador Astra",
              "Berpartisipasi dalam proyek Astra",
            ]),

            _buildInfoBox("Persyaratan", [
              "Mahasiswa S1 semester 4 & 6, IPK > 3,00",
              "Memiliki prestasi non-akademik, organisasi, magang",
              "Tidak menerima beasiswa lain (Juni - November 2025)",
              "Bersedia menjadi Astra Ambassador",
            ]),

            _buildInfoBox("Lampiran", [
              "Link Panduan",
              "Link Template",
            ], isLink: true),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Link Pendaftaran",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: _toggleNotification,
                  icon: Icon(
                    Icons.notifications,
                    color: isNotificationSaved ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(
    String title,
    List<String> items, {
    bool isLink = false,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ...items.map(
            (item) =>
                isLink
                    ? GestureDetector(
                      onTap: () {},
                      child: Text(
                        item,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                    : Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 5),
                        Expanded(child: Text(item)),
                      ],
                    ),
          ),
        ],
      ),
    );
  }
}
