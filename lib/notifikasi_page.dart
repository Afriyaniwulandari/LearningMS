import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  notification['type'] == 'tugas'
                      ? Icons.assignment
                      : Icons.quiz,
                  color: const Color(0xFFA47DAB),
                  size: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification['message']!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification['time']!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

const List<Map<String, String>> notifications = [
  {
    'type': 'tugas',
    'message':
        'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
    'time': '3 Hari 9 Jam Yang Lalu',
  },
  {
    'type': 'kuis',
    'message': 'Anda telah menyelesaikan kuis Assessment 2',
    'time': '5 Hari 12 Jam Yang Lalu',
  },
  {
    'type': 'tugas',
    'message':
        'Anda telah mengirimkan pengajuan tugas untuk Tugas 01 – UID Android Mobile Game',
    'time': '1 Minggu 2 Hari Yang Lalu',
  },
  {
    'type': 'kuis',
    'message': 'Anda telah menyelesaikan kuis Quiz Review 01',
    'time': '2 Minggu Yang Lalu',
  },
];
