import 'package:flutter/material.dart';

class FavoriteQuoteScreen extends StatefulWidget {
  const FavoriteQuoteScreen({super.key});

  @override
  State<FavoriteQuoteScreen> createState() => _FavoriteQuoteScreenState();
}

class _FavoriteQuoteScreenState extends State<FavoriteQuoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          const Center(child: Text('favorite', style: TextStyle(fontSize: 70))),
    );
  }
}
