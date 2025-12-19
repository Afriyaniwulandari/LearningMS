import 'package:flutter/material.dart';

class KelasPage extends StatelessWidget {
  const KelasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Kelas Saya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CourseDetailPage(course: course),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    course['image']!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '2021/2',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      course['name']!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      course['code']!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    LinearProgressIndicator(
                                      value: course['progress']! / 100,
                                      backgroundColor: Colors.grey[300],
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                            Color(0xFFA47DAB),
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${course['progress']}% Selesai',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseDetailPage extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 4,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFA47DAB), Color(0xFFFF69B4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  course['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  course['code']!,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: const [
                Tab(text: 'Materi'),
                Tab(text: 'Tugas Dan Kuis'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Materi
            ListView.builder(
              itemCount: materials.length,
              itemBuilder: (context, index) {
                final material = materials[index];
                return Card(
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Pertemuan ${index + 1}',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(material['title']!),
                    subtitle: Text(material['info']!),
                    trailing: Icon(
                      material['completed']!
                          ? Icons.check_circle
                          : Icons.circle,
                      color: material['completed']!
                          ? Colors.green
                          : Colors.grey,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailMateriPage(material: material),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            // Tab Tugas dan Kuis
            ListView(
              children: [
                // Quiz
                Card(
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Quiz',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: const Text('Quiz Review 01'),
                    subtitle: const Text('Tenggat: 25 Februari 2021 23:59 WIB'),
                    trailing: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  ),
                ),
                // Tugas
                Card(
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Tugas',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: const Text('Tugas 01 – UID Android Mobile Game'),
                    subtitle: const Text('Tenggat: 26 Februari 2021 23:59 WIB'),
                    trailing: const Icon(Icons.circle, color: Colors.grey),
                  ),
                ),
                // Another Quiz
                Card(
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Pertemuan 3',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: const Text('Kuis – Assessment 2'),
                    subtitle: const Text('Tenggat: 28 Februari 2021 23:59 WIB'),
                    trailing: const Icon(Icons.circle, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailMateriPage extends StatelessWidget {
  final Map<String, dynamic> material;

  const DetailMateriPage({super.key, required this.material});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(material['title']!),
        backgroundColor: const Color(0xFFA47DAB),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lampiran Materi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.picture_as_pdf),
                    title: const Text('Materi_UI_Design.pdf'),
                    subtitle: const Text('PDF'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.slideshow),
                    title: const Text('Presentasi_UI.pptx'),
                    subtitle: const Text('PPT'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.link),
                    title: const Text('Referensi UI Design'),
                    subtitle: const Text('URL'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Rundown Pembelajaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  ListTile(
                    title: Text('1. Tujuan Pembelajaran'),
                    subtitle: Text('Memahami konsep dasar UI Design'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('2. Materi Inti'),
                    subtitle: Text('Elemen-elemen UI dan prinsip desain'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('3. Studi Kasus'),
                    subtitle: Text('Analisis aplikasi mobile'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('4. Diskusi'),
                    subtitle: Text('Pertanyaan dan jawaban'),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('5. Penugasan'),
                    subtitle: Text('Tugas praktis UI Design'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<Map<String, dynamic>> courses = [
  {
    'name': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
    'code': 'UID101 - Dr. Ahmad',
    'progress': 89,
    'image': 'image/desain.png',
  },
  {
    'name': 'KEWARGANEGARAAN',
    'code': 'KW101 - Prof. Siti',
    'progress': 86,
    'image': 'image/pkn.png',
  },
  {
    'name': 'SISTEM OPERASI',
    'code': 'SO101 - Dr. Budi',
    'progress': 90,
    'image': 'image/sistem.png',
  },
  {
    'name': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
    'code': 'PPBM101 - Dr. Rina',
    'progress': 90,
    'image': 'image/bergerak.png',
  },
  {
    'name': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
    'code': 'ENG101 - Ms. Lisa',
    'progress': 90,
    'image': 'image/Inggris.png',
  },
  {
    'name': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
    'code': 'PMI101 - Dr. Eko',
    'progress': 90,
    'image': 'image/media.png',
  },
  {
    'name': 'OLAH RAGA',
    'code': 'OR101 - Coach Tono',
    'progress': 90,
    'image': 'image/olahraga.png',
  },
];

const List<Map<String, dynamic>> materials = [
  {
    'title': '01 – Pengantar User Interface Design',
    'info': '3 URL, 2 Files, 3 Interactive Content',
    'completed': true,
  },
  {
    'title': '02 – Konsep User Interface Design',
    'info': '2 URL, 1 File, 2 Interactive Content',
    'completed': false,
  },
  {
    'title': '03 – Interaksi pada User Interface Design',
    'info': '4 URL, 3 Files, 1 Interactive Content',
    'completed': false,
  },
  {
    'title': '04 – Ethnographic Observation',
    'info': '1 URL, 2 Files, 4 Interactive Content',
    'completed': false,
  },
];
