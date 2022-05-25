import 'package:flutter/material.dart';

class searchPage extends StatefulWidget {
  final String title;
  const searchPage(this.title) : assert(title != null);

  @override
  State<searchPage> createState() => _searchPageState();
}


class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: arama());
  }
}


class arama extends StatefulWidget {
  const arama({Key? key}) : super(key: key);

  @override
  State<arama> createState() => _aramaState();
}

class _aramaState extends State<arama> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      color: Colors.black,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 15),
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white60),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      borderSide: BorderSide(width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white60),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: 'Search..',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

