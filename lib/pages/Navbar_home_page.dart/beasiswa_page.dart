import 'package:flutter/material.dart';
import 'package:team10_dhiraga/widgets/mesh_gradient_background.dart';
import 'link_page.dart';

class BeasiswaPage extends StatefulWidget {
  @override
  _BeasiswaPageState createState() => _BeasiswaPageState();
}

class _BeasiswaPageState extends State<BeasiswaPage> {
  bool isNotificationOn = false;

  void _toggleNotification() {
    setState(() {
      isNotificationOn = !isNotificationOn;
    });

    if (isNotificationOn) {
      _showNotificationDialog();
    }
  }

  void _showNotificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/thumbs_up.png", height: 80),
              SizedBox(height: 10),
              Text(
                "Notifikasi telah disimpan!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Tetap semangat dan terus berkembang bersama Dhiraga!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.blue.shade700,
                ),
                child: Text("Kembali", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToLink(String link) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LinkPage(link: link)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Beasiswa Pertamina Sobat Bumi',
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
              Text(
                "BEASISWA PERTAMINA SOBAT BUMI 2025 DIBUKA",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "4 FEBRUARI 2025 - 4 MARET 2025",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),

              /// Bagian Beasiswa
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "4 Feb 2025 - 4 Mar 2025",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Pertamina Foundation",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text("D3/D4/D1", style: TextStyle(fontSize: 14)),
                      Text(
                        "Universitas Indonesia (dan 37 lainnya)",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text(
                "Manfaat",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("- Fully Funded", style: TextStyle(fontSize: 14)),
                      Text(
                        "- Bantuan biaya pendidikan / UKT",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "- Bantuan biaya hidup",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "- Koneksi dengan mahasiswa se-Indonesia, Pertamina Group, dan Pertamina Foundation",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text(
                "Persyaratan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "- Warga Negara Indonesia (WNI)",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "- Kuliah di kampus mitra Pertamina Foundation",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "- Mahasiswa aktif (tidak sedang cuti)",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "- Minimal semester 2 dan maksimal semester 6 dengan IPK ≥ 3,00",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "- Tidak sedang menerima beasiswa lain (Januari-Desember 2024)",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "- Memiliki sertifikat TOEFL/IELTS menjadi nilai tambah.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text(
                "Lampiran",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:
                            () =>
                                _navigateToLink("https://example.com/panduan"),
                        child: Text(
                          "- Link Panduan",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap:
                            () =>
                                _navigateToLink("https://example.com/template"),
                        child: Text(
                          "- Link Template",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Tombol Link Pendaftaran
                  ElevatedButton(
                    onPressed:
                        () =>
                            _navigateToLink("https://example.com/pendaftaran"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 18,
                      ),
                      backgroundColor: Colors.blue.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Link Pendaftaran",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),

                  SizedBox(width: 15),

                  /// Ikon Notifikasi dalam Lingkaran
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue.shade900, width: 2),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color:
                            isNotificationOn
                                ? Colors.blue.shade700
                                : Colors.blue.shade900,
                      ),
                      onPressed: _toggleNotification,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
