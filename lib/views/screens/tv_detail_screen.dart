import 'package:flutter/material.dart';

class TvDetailScreen extends StatefulWidget {
  const TvDetailScreen({super.key, required int id});

  @override
  State<TvDetailScreen> createState() => _TvDetailScreenState();
}

class _TvDetailScreenState extends State<TvDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Text('Tv Show details here'), 
    );
    
  }
}
