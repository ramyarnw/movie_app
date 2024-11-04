import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/tv_shows.dart';
import 'package:movie_app/views/screens/tv_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../models/app_state.dart';
import '../../models/cast.dart';
import '../../models/movie.dart';
import '../../view_model/app_view_model.dart';
import 'movie_detail_screen.dart';
import 'movie_home_page.dart';

class CastDetailScreen extends StatefulWidget {
  const CastDetailScreen({super.key, required this.id});

  final int id;

  @override
  State<CastDetailScreen> createState() => _CastDetailScreenState();
}

class _CastDetailScreenState extends State<CastDetailScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  var loading = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    getData();
  }

  Future<void> getData() async {
    setState(() {
      loading = true;
    });
    await context.read<AppViewModel>().getCastForId(id:widget.id);
    await context.read<AppViewModel>().getMoviesOfCast(id:widget.id);
    await context.read<AppViewModel>().getTvShowsOfCast(id:widget.id);

    setState(() {
      loading = false;
    });
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
    BuiltList<Movie> castMovie =
        context
            .watch<AppState>()
            .moviesOfCast ?? BuiltList();
    final BuiltList<TvShows> castTvShow =
        context
            .watch<AppState>()
            .tvShowsOfCast ?? BuiltList();
    Cast? cast =
        context.watch<AppState>().currentPicCast;
    //var cast = Cast();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 300,
        title: Column(
          children: [
             Text(
              cast.name,
              style: const TextStyle(fontSize: 25, color: Colors.black,),
            ),
            Row(
              children: [

                 Image.network(
                    cast.posterImage,
                    //image,
                    width: 150,
                   height: 150,

                ),
                Column(
                  children: [
                  //  Text(cast.adult.toString()),
                    Text(cast.id.toString()),
                    //Text(cast.gender.toString()),
                   // Text(cast.knownForDepartment),
                    //Text(cast.name),
                    Text(cast.originalName),
                    //Text(cast.popularity.toString()),
                    //Text(cast.profilePath),
                    Text(cast.castId.toString()),
                   // Text(cast.profilePath),
                    //Text(cast.character),
                    //Text(cast.creditId),
                    Text(cast.order.toString()),
                  ],
                )
              ],
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery
              .of(context)
              .size
              .width, 60),
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
      body: loading
          ? const CircularProgressIndicator()
          : TabBarView(
        controller: tabController,
        children: <Widget>[
          GridView.builder(
            itemCount: castMovie.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
              var p = castMovie[index];
              // final image = images[index];
              // final title = movieTitle[index];
              return CastMovieTile(movie: p);
              // title: title,
              // image: image,
              /*Image.network(
                  images[index], semanticLabel: movieTitle[index]);*/
            },
          ),
          GridView.builder(
            itemCount: castTvShow.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
              var p = castTvShow[index];
              // final image = images[index];
              // final title = movieTitle[index];
              return TvTile(
                tv: p,
                // title: title,
                // image: image,
              );
              //Image.network(images[index],semanticLabel: movieTitle[index]);
            },
          ),
        ],
      ),
    );
  }
}

//COMPONENT TVTILE
class TvTile extends StatelessWidget {
  const TvTile({
    super.key,
    required this.tv,
  });

  final TvShows tv;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return TvDetailScreen(id: tv.id,);
                }));
          },
          child: Image.network(
            tv.posterImage,
            //image,
            width: 80,
          ),
        ),
        Text(tv.name),
        //Text(title),
      ],
    );
  }
}
//cast movietile component
class CastMovieTile extends StatelessWidget {
  const CastMovieTile({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return  MovieDetailScreen(id: movie.id,);
                }));
          },
          child:
          Image.network(
            movie.posterImage,
            //image,
            width: 80,
          ),
        ),
        Text(movie.title),
        //Text(title),
      ],
    );
  }
}
