import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShoeSizeScroll extends StatefulWidget {
  const ShoeSizeScroll({super.key});

  @override
  State<ShoeSizeScroll> createState() => _ShoeSizeScrollState();
}

class _ShoeSizeScrollState extends State<ShoeSizeScroll> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          width: 80,
          height: 9.5,
          decoration:
               BoxDecoration(
                shape: BoxShape.rectangle, 
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10.0),
               ),
          child: const Center(
            child: Text(
                  "39",
                  style: TextStyle(
                  color: Colors.black
                ),
              ),
          ),
          
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          width: 80,
          height: 9.5,
          decoration:
               BoxDecoration(shape: BoxShape.rectangle, color: Colors.white,  borderRadius: BorderRadius.circular(10.0),),

          child: const Center(
            child: Text(
                  "40",
                  style: TextStyle(
                  color: Colors.black
                ),
              ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          width: 80,
          height: 9.5,
          decoration:
               BoxDecoration(shape: BoxShape.rectangle, color: Colors.white,  borderRadius: BorderRadius.circular(10.0),),
          child: const Center(
            child: Text(
                  "41",
                  style: TextStyle(
                  color: Colors.black
                ),
              ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          width: 80,
          height: 9.5,
          decoration:
               BoxDecoration(shape: BoxShape.rectangle, color: Colors.blue,  borderRadius: BorderRadius.circular(10.0),),
          child: const Center(
            child: Text(
                  "42",
                  style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255)
                ),
              ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          width: 80,
          height: 9.5,
          decoration:
               BoxDecoration(shape: BoxShape.rectangle, color: Colors.white,  borderRadius: BorderRadius.circular(10.0),),
          child: const Center(
            child: Text(
                  "43",
                  style: TextStyle(
                  color: Colors.black
                ),
              ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          width: 80,
          height: 9.5,
          decoration:
               BoxDecoration(shape: BoxShape.rectangle, color: const Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10.0),),
          child: const Center(
            child:  Text(
                  "44",
                  style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0)
                ),
              ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          width: 80,
          height: 9.5,
          decoration:
               BoxDecoration(shape: BoxShape.rectangle, color: Colors.white,  borderRadius: BorderRadius.circular(10.0),),
            child: const Center(
            child: Text(
                  "45",
                  style: TextStyle(
                  color: Colors.black
                ),
              ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          width: 80,
          height: 9.5,
          decoration:
               BoxDecoration(shape: BoxShape.rectangle, color: Colors.white,  borderRadius: BorderRadius.circular(10.0),),
          child: const Center(
            child: Text(
                  "46",
                  style: TextStyle(
                  color: Colors.black
                ),
              ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          width: 80,
          height: 9.5,
          decoration:
               BoxDecoration(shape: BoxShape.rectangle, color: Colors.white,  borderRadius: BorderRadius.circular(10.0),),
          child: const Center(
            child: Text(
                  "47",
                  style: TextStyle(
                  color: Colors.black
                ),
              ),
          ),
        ),
      ],
    );
  }
}
