import 'package:flutter/material.dart';

class LinkPage extends StatelessWidget {
  final String link; // Parameter untuk menyimpan link yang diklik

  // Constructor untuk menerima link
  LinkPage({required this.link});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Link')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Anda akan dialihkan ke:", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(
              link,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk membuka link di browser
                // Contoh: menggunakan package url_launcher
              },
              child: Text("Buka Link"),
            ),
          ],
        ),
      ),
    );
  }
}
