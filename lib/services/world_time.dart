import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{

  late String location;// location name for the UI
  late String time="";// the time in that location
  late String flag;//url to an asset flag icon
  late String url;//Endpoint of the location
  late bool isDaytime;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{

    try{
      //Simulate network request for a username
      //Asynchronous starts the request but doesn't blocks the other codes
      Response response= await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data=jsonDecode(response.body);
      print(data);
      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime=now.hour>6 && now.hour<20 ? true : false;
      // set the time property
      time=DateFormat.jm().format(now);

    }
    catch(e){
      time='could not get time data';
    }









  }




}