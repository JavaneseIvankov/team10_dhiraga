import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notification_provider.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);
    final savedEvents = notificationProvider.savedNotifications;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifikasi Event",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 44, 74, 221),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child:
            savedEvents.isEmpty
                ? Center(
                  child: Text("Belum ada beasiswa dan webinar yang disimpan."),
                )
                : ListView.builder(
                  itemCount: savedEvents.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(savedEvents[index]['title']!),
                        subtitle: Text(savedEvents[index]['date']!),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            notificationProvider.removeNotification(
                              savedEvents[index]['title']!,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
