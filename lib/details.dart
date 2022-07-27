import 'package:flutter/material.dart';
import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:plant_disease/widgets/description.dart';

class DetailsPage extends StatefulWidget {
  static const valueKey = ValueKey("DetailsPage");
  const DetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int currentTab = 0;
  int currentTabGetter() => currentTab;

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
              return Card(
                color: Colors.white,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      child: const Icon(Icons.drag_handle_outlined),
                    ),
                    Expanded(
                        child: ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        const Text(
                          "The picture captured is of",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins-Bold",
                              color: Color.fromARGB(255, 130, 130, 130)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 3.0),
                          child: const Text(
                            "Strawberry",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Poppins-Bold",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Chip(
                            avatar: null,
                            backgroundColor: Color.fromARGB(255, 112, 112, 112),
                            label: Text(
                              'Rosaceae',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        Container(
                          alignment: Alignment.topLeft,
                          child: CupertinoTabBar.CupertinoTabBar(
                            Colors.white,
                            const Color.fromARGB(255, 224, 224, 224),
                            [
                              Text(
                                "Disease",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 12,
                                    fontWeight: currentTab == 0
                                        ? FontWeight.w800
                                        : null),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Remedy",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 12,
                                    fontWeight: currentTab == 1
                                        ? FontWeight.w800
                                        : null),
                                textAlign: TextAlign.center,
                              ),
                            ],
                            currentTabGetter,
                            (int index) {
                              setState(() {
                                currentTab = index;
                              });
                            },
                            useSeparators: false,
                            allowScrollable: false,
                            fittedWhenScrollable: true,
                            useShadow: false,
                            animateWhenScrollable: false,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        currentTab == 0
                            ? const Description(
                                title: "Identified Disease",
                                description:
                                    """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.""",
                              )
                            : const Description(
                                title: "Recommended Remedy",
                                description:
                                    """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est urna aliquet nec sapien, non aliquam proin. Maecenas vel viverra adipiscing nec nisl sed et leo.""",
                              ),
                      ],
                    ))
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
