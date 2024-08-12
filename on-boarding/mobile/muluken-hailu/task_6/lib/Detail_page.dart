import 'package:flutter/material.dart';
import 'home_page.dart';
import 'shoe_size_scroll.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 40, 8, 12),
        child: Container(
          height: 1020,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 25 / 20,
                        child: Image.asset(
                          "assets/images/shoe.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 2,
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
                              child: Text(
                                "Derby Leather Shoe",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
                              child: Text("\$120"),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                              child: Text(
                                "Men's shoe",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w100),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Color.fromARGB(255, 252, 198, 0),
                                  ),
                                  Text(
                                    "(4.0)",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [Text("Size:")],
                          ),
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 350,
                              child: const ShoeSizeScroll(),
                              ),
                          //  const Padding(
                          //     padding: EdgeInsets.all(8.0),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       children: [
                          //         Padding(
                          //           padding: EdgeInsets.all(8),
                          //           child: FloatingActionButton(
                          //             backgroundColor:
                          //                 Color.fromARGB(255, 255, 255, 255),
                          //             onPressed: null,
                          //             child: Text(
                          //               "41",
                          //               style: TextStyle(
                          //                 color: Colors.black
                          //               ),
                          //               ),
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding: EdgeInsets.all(8),
                          //           child: FloatingActionButton(
                          //             backgroundColor:
                          //                 Color.fromARGB(255, 255, 255, 255),
                          //             onPressed: null,
                          //             child: Text("41",
                                      
                          //             ),
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding: EdgeInsets.all(8),
                          //           child: FloatingActionButton(
                          //             backgroundColor: Colors.blueAccent,
                          //             onPressed: null,
                          //             child: Text("41"),
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding: EdgeInsets.all(8),
                          //           child: FloatingActionButton(
                          //             backgroundColor:
                          //                 Color.fromARGB(255, 250, 251, 251),
                          //             onPressed: null,
                          //             child: Text("41"),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          ],
                        ),
                        const Card(
                          elevation: 0,
                          child: Text(
                            "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 25, 10, 0),
                              child: Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 250, 250, 250),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.red, // Border color
                                    width: 1, // Border width
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 198, 33, 33)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 25, 10, 0),
                              child: Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 54, 98, 244),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Update",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
