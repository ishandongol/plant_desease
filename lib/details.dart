import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  static const valueKey = ValueKey("DetailsPage");
  const DetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the DetailsPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
        ),
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
          ),
          onTap: () {
            Navigator.of(context).pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Image.asset(
              "images/test.jpeg",
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            DraggableScrollableSheet(builder:
                (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.white,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('Item $index'));
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
