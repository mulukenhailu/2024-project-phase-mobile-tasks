import "package:flutter/material.dart";
import 'home_page.dart';

class SeachPage extends StatelessWidget {
  const SeachPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 40,
          width: 40,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
        ),
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 65.0),
          child: const Text("Search Product"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: SizedBox(
                      height: 48,
                      width: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_forward_rounded),
                          border: OutlineInputBorder(),
                          hintText: 'Leather',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              height: 250,
                              width: double.infinity,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Category",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 290,
                                    height: 48,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const Text("Price"),
                                  RangeSlider(
                                    values: const RangeValues(20, 80),
                                    min: 0,
                                    max: 100,
                                    divisions: 10,
                                    labels: const RangeLabels('20', '80'),
                                    onChanged: (RangeValues newValues) {
                                      // Handle the slider value changes
                                    },
                                    activeColor: Colors.blue,
                                    inactiveColor: Colors.blue.withOpacity(
                                        0.3), // Optional: to make the inactive part also blue
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors.blue,
                                          minimumSize: const Size(100, 50),
                                        ),
                                        child: const Text("Apply")),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 2,
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Icon(
                        Icons.filter_list_rounded,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: _buildCard(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Card> _buildCard(int count) {
  List<Card> card = List.generate(
    count,
    (int index) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 10 / 5,
              child: Image.asset(
                "assets/images/shoe.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
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
                      )
                    ],
                  ),
                  Row(
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
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
  return card;
}
