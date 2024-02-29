import 'package:flutter/material.dart';

class Searching extends StatefulWidget {
  const Searching({super.key});

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {

  String dropDownValue = 'DET';

  // List of items in our dropdown menu
  var items = [
    'DET',
    'CET',
    'MBA',
    'PHD',
    'Economics',
    'Geography',
    'Business Studies',
    'History',



  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Courses'),
      ),
      body:
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DropdownButton(
                      style: const TextStyle(color: Color.fromRGBO(
                          114, 93, 210, 1.0),fontSize: 20,fontWeight: FontWeight.w500),
                
                      // Initial Value
                      value: dropDownValue,
                
                      // Down Arrow Icon
                      icon:const Icon(Icons.keyboard_arrow_down),
                
                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
            
            
            
            
              ],
            ),
          ),
        ),
    );
  }
}
