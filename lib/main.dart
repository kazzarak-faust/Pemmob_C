import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ujian CPMK 3 Pemrograman Mobile',
      home: const HomePage(),
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/gallery', page: () => const GalleryPage()),
        GetPage(name: '/portfolio', page: () => const PortfolioPage()),
        GetPage(name: '/services', page: () => const ServicesPage()),
        GetPage(name: '/contact', page: () => const ContactPage()),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeContent(),
    GalleryPage(),
    ServicesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter GetX Navigation')), 
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Gallery'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Services'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.home, size: 60),
          SizedBox(height: 20),
          Text('Selamat Datang di Home Page', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.photo, size: 60),
          const SizedBox(height: 20),
          const Text('Gallery Page', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Get.to(const PortfolioPage());
            },
            child: const Text('Lihat Portfolio'),
          ),
        ],
      ),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio Page')),
      body: const Center(
        child: Text('Ini adalah Portfolio Page', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.build, size: 60),
          const SizedBox(height: 20),
          const Text('Services Page', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Get.to(const ContactPage());
            },
            child: const Text('Hubungi Kami'),
          ),
        ],
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Page")),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hubungi Kami", 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // 👉 Di sini kamu tambahkan nama dan NIM
            Text("Nama: Muhammad Fadhel Fausta"),
            Text("NIM: H1D023113"),

            SizedBox(height: 20),
            Text("Email: muhammad.fausta@mhs.unsoed.ac.id"),
          ],
        ),
      ),
    );
  }
}

