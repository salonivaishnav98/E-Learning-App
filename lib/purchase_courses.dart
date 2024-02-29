import 'package:flutter/material.dart';

class PurchaseCourse extends StatefulWidget{
  @override
  State<PurchaseCourse> createState() => _PurchaseCourseState();
}

class _PurchaseCourseState extends State<PurchaseCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MBA'),
        backgroundColor: Colors.blue.withOpacity(0.4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.lightBlue.withOpacity(0.3),
                image: const DecorationImage(image: AssetImage('assets/images/mba.png'),fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 10,),
            const Text('Master of Business Administration',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)),
            const Text('About Course:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black87),),
            const Text("Elevate your career to new heights with our comprehensive Master of Business Administration (MBA) program. "
                "Designed for professionals aspiring to leadership roles, "
                "this transformative course equips you with the strategic vision, managerial skills, "
                "and business acumen necessary to navigate the complex challenges of the modern business landscape."
            ,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.black54),),

            const SizedBox(
              height: 20,
            ),

            Container(
              //height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:  Colors.lightBlueAccent.withOpacity(0.3)
              ),

              child: const ListTile(
                //tileColor: Colors.lightBlueAccent.withOpacity(0.3),
                leading: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage('https://www.shutterstock.com/image-photo/passport-photo-portrait-asian-smiling-260nw-1041841363.jpg',)
                  ),
                title: Text('Ms. Rose'),
                subtitle: Text('MBA from Parul University, Gujrat'),
              ),
            ),
          ],

        ),
      ),
    );
  }
}