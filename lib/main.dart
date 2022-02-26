import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'insta.dart';
import 'package:flutter/material.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        primarySwatch: Colors.yellow,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<Insta> InstaList = [
    Insta(imguser: 'assets/images/mm1.jpg', img: 'assets/images/m1.jpg',
        userpost: 'TASTE OF YOUR LIFE', comments: [Comments(user: 'Mamuang', comment: "Have a good day."),Comments(user: 'Mimi', comment: 'You too!')],
        caption: "TIME WILL CHANGE THE TASTE PF YOUR LIFE"),
    Insta(imguser: 'assets/images/mm2.jpg', img: 'assets/images/m2.jpg',
        userpost: 'FEELING LIKE THAT',comments: [Comments(user: 'Mamuang', comment: 'I miss your smile so much right now ❤'),Comments(user: 'Mimi', comment: 'Come on ><')],
  caption: 'YOU ARE THE FEELING THAT I MISSED'),
    Insta(imguser: 'assets/images/mm3.jpg', img: 'assets/images/m4.jpg',
        userpost: 'AS ALWAYS',comments: [Comments(user: 'Mamuang', comment: 'No one matters but you.'),Comments(user: 'Mimi', comment: 'so cute.')],
  caption: 'THE HEART IS RIGHT HERE, AS ALWAYS'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade600,
      appBar: AppBar(title: Text('InstaMamuang',
          style: TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,))),
      body: ListView.builder(
          itemCount: InstaList.length,
          itemBuilder: (context, index) =>
              MyCard(insta: InstaList[index])),

    );
  }
}
class MyCard extends StatefulWidget {
  final Insta insta;

  const MyCard({
    Key? key,
    required this.insta,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(covid.date),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.insta.imguser}'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                        '${widget.insta.userpost}'
                    )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),)
              ],
            ),
          ),
          Image.asset('${widget.insta.img}',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                /*SizedBox(width: 5.0),*/
                Expanded(
                    child: Text(
                        '${widget.insta.caption}'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                for(int i=0;i<widget.insta.comments.length;i++)
                Row(
                  children: [
                    SizedBox(height: 23.0,),
                    Text(
                        '${widget.insta.comments[i].user}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                        color: Colors.yellow.shade600,
                          fontSize: 15.0,
                      ),
                    ),
                    SizedBox(width: 5.0,),
                    Text(
                      '${widget.insta.comments[i].comment}',
                      style: TextStyle(

                      ),
                    )
                  ],
                ),
              ],
            ),
          ),


                Row(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        like = !like;
                      });
                    }, icon: like? Icon(Icons.favorite,color: Colors.red,): Icon(Icons.favorite_border),),
                    Expanded(
                      child: TextField(
                        onSubmitted: (value){

                          setState(() {
                            widget.insta.comments.add(Comments(user: 'Flutter', comment: value));
                            controller.clear();

                          });
                        },
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Add a comment',
                        ),
                      ),
                    ),
                  ],
                )


        ],
      ),
    );
  }
}
