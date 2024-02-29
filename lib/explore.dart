import 'package:evergreen_seed/purchase_courses.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore Courses",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
        backgroundColor: const Color.fromRGBO(229, 210, 241, 1.0),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg1.png'),fit: BoxFit.cover)
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text('Popular Courses:',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),

                Row(
                  children: [
                    Expanded(

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),

                        child: InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PurchaseCourse(),));
                          },
                          child: Container(
                            height: 200,
                            decoration:BoxDecoration(
                              color: const Color.fromRGBO(
                                  200, 250, 199, 1.0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Algorithms',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                ),
                                Text('Lectures - 00'),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          decoration:BoxDecoration(
                            color: const Color.fromRGBO(
                                236, 208, 250, 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Data Structures',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ),
                              Text('Lectures - 00'),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          decoration:BoxDecoration(
                            color: const Color.fromRGBO(
                                198, 242, 252, 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Languages',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ),
                              Text('Lectures - 00'),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          decoration:BoxDecoration(
                            color: const Color.fromRGBO(
                                250, 196, 194, 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Placement',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ),
                              Text('Lectures - 00'),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          decoration:BoxDecoration(
                            color: const Color.fromRGBO(
                                199, 174, 248, 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Interviews',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ),
                              Text('Lectures - 00'),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          decoration:BoxDecoration(
                            color: const Color.fromRGBO(
                                242, 188, 246, 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Coding Problems',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ),
                              Text('Lectures - 00'),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          decoration:BoxDecoration(
                            color: const Color.fromRGBO(
                                185, 246, 171, 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Interviews',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ),
                              Text('Lectures - 00'),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          decoration:BoxDecoration(
                            color: const Color.fromRGBO(
                                250, 234, 174, 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Coding Problems',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ),
                              Text('Lectures - 00'),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
