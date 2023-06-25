import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              "History",
              style: TextStyle(
                fontFamily: 'Indie Flower',
                fontWeight: FontWeight.bold,
              ),
            ),
            floating: true,
            snap: true,
          ),
          SliverFillRemaining(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Image.asset('assets/images/sale_4.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Aplikasi Listbook ini dikembangkan dengan tujuan penggunanya untuk mencari daftar laptop yang sangat lengkap dalam genggaman tangan dan mudah....',
                      style: TextStyle(
                        fontFamily: 'Indie Flower',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Partner Kerja Sama',
                      style: TextStyle(
                        fontFamily: 'Indie Flower',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8, // Jumlah partner kerja sama
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/partner${index + 1}.jpeg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    child: Text(
                      'Bergabunglah dengan kami dalam perjalanan untuk mencapai kesuksesan bersama, Kami bangga bermitra dengan perusahaan-perusahaan terkemuka dalam industri ini, Dengan kolaborasi yang kuat, kita dapat mencapai pertumbuhan dan kesuksesan yang berkelanjutan.',
                      style: TextStyle(
                        fontFamily: 'Indie Flower',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
