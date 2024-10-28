import 'package:flutter/material.dart';

import 'movie_home_page.dart';

class CastDetailScreen extends StatefulWidget {
  const CastDetailScreen({super.key});

  @override
  State<CastDetailScreen> createState() => _CastDetailScreenState();
}

class _CastDetailScreenState extends State<CastDetailScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<String> images = [
    "https://i.pinimg.com/736x/c3/71/26/c371266d68ea6311ef02540d2d0503ad.jpg",
    "https://i.pinimg.com/originals/a1/88/96/a18896faf54f0aff380de277b2cd10b2.jpg",
    "https://i.pinimg.com/564x/42/10/d6/4210d628498c2c087aa222cb73f51bba.jpg",
    "https://i.pinimg.com/564x/98/c7/5a/98c75ac110bfd99ed1403b8e9f8c3f34.jpg",
    "https://i.pinimg.com/474x/1c/30/44/1c3044e818cd0bf50a8edd0278067a34.jpg",
    "https://i.pinimg.com/474x/02/a5/96/02a5965b18572a4d009b3ada3a5e7256.jpg",
    "https://i.pinimg.com/474x/2b/ef/02/2bef0206deeb2fdab11608fd3d0d60a7.jpg",
    "https://i.pinimg.com/564x/11/0f/a3/110fa3772d0e55a32957020b70cdbcbe.jpg",
    "https://i.pinimg.com/474x/a6/2d/59/a62d599b934b27742aca9527da759ff8.jpg",
  ];
  List<String> movieTitle = [
    'THE BREAKFAST CLUB',
    'A QUIET PLACE',
    'TANGLED 2010',
    'LILO & STITCH 2002',
    'LILO & STITCH 2002',
    'MOANA 2016',
    'RIO 2011',
    'CARS 2006',
    'ALVIN AND THE CHIKMUNKS 2007',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Molls',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            Row(
              children: [
                Image(image: AssetImage(
                  'assets/molly_ringwald.png',
                ),),

              ],
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: TabBar(
            controller: tabController,
            dividerColor: Colors.transparent,
            tabs: const <Widget>[
              Tab(
                text: 'Movie',
                icon: Icon(Icons.movie),
              ),
              Tab(
                text: 'TV Shows',
                icon: Icon(Icons.star_rate),
              ),
            ],
          ),
        ),
      ),

      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          GridView.builder(
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
              final image = images[index];
              final title = movieTitle[index];
              return MovieTile(
                title: title,
                image: image,
              ); /*Image.network(
                  images[index], semanticLabel: movieTitle[index]);*/
            },
          ),
          GridView.builder(
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
              final image = images[index];
              final title = movieTitle[index];
              return MovieTile(
                title: title,
                image: image,
              ); /* Image.network(
                  images[index], semanticLabel: movieTitle[index]);*/
            },
          ),
          GridView.builder(
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
              final image = images[index];
              final title = movieTitle[index];
              return MovieTile(
                title: title,
                image: image,
              );
              //Image.network(images[index],semanticLabel: movieTitle[index]);
            },
          ),
        ],
      ),
      //body: const Text('CAST DETAILS SHOWN HERE'),
    );
  }
}