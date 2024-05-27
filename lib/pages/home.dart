import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data :ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bgImage=data['isDaytime']?'day1.gif':'night1.gif';
    Color bg=data['isDaytime']?Colors.blue:Colors.black26;



    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('ass/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0,0.0),
            child: Column(
              children: [
                SizedBox(height: 160,),
                TextButton.icon(
                    onPressed: () async {
                      dynamic result=await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data={
                          'time':result['time'],
                          'location':result['location'],
                          'flag':result['flag'],
                          'isDaytime':result['isDaytime'],
                        };
                      });
                    },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.black,
                  ),
                  label: Text('Edit Location'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 50.0,),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 40.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 70.0,
                    color: Colors.white,
                  ),
                )
          
              ],
            ),
          ),
        ),

      ),
    );
  }
}
