import 'package:flutter/material.dart';
import '../widget/sidebar.dart';
import 'konten/imagecarousel.dart';
import 'konten/konten.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Column(children: [
              Text('Listbook'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.black))
            ]),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(child: ImageCarousel()),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Artikel'.toUpperCase(),
                    style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black)),
                  SizedBox(
                    width: 180,
                    child: AspectRatio(
                      aspectRatio: 1.25,
                      child: Image.asset("assets/images/sale_3.png"),
                    ),
                  ),
                  KontenPertama(),
                  SizedBox(
                    width: 180,
                    child: AspectRatio(
                      aspectRatio: 1.25,
                      child: Image.asset("assets/images/sale_2.png"),
                    ),
                  ),
                  KontenKedua(),
                  SizedBox(
                    width: 180,
                    child: AspectRatio(
                      aspectRatio: 1.25,
                      child: Image.asset("assets/images/sale_4.png"),
                    ),
                  ),
                  KontenKetiga(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
