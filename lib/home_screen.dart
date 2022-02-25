import 'package:flutter/material.dart';
import 'items_class.dart';
import 'package:just_audio/just_audio.dart';
import 'package:bordered_text/bordered_text.dart';



class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {

final AudioPlayer audioPlayer = AudioPlayer();

  List<items> myItems = [
    items(
        names: "Forest Sounds",
        audioPath: "audios/forest.mp3",
        imagePath: "images/forest.jpeg"),
    items(
        names: "Night Sounds",
        audioPath: "audios/night.mp3",
        imagePath: "images/night.jpeg"),
    items(
        names: "Ocean Sounds",
        audioPath: "audios/ocean.mp3",
        imagePath: "images/ocean.jpeg"),
    items(
        names: "Waterfall Sounds",
        audioPath: "audios/waterfall.mp3",
        imagePath: "images/waterfall.jpeg"),
    items(
        names: "Wind Sounds",
        audioPath: "audios/wind.mp3",
        imagePath: "images/wind.jpeg"),
  ];
   int? isplaying;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black54,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0XFF303030),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Good Morning, Aqeel",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white70,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Scrollbar(
                child: ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: myItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(

                      margin: EdgeInsets.all(10),
                      height: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2,
                            offset: Offset(0, 3), // Shadow position
                          ),
                        ],
                        borderRadius: BorderRadiusDirectional.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              myItems[index].imagePath,
                            )),
                      ),
                      child: ListTile(
                        leading: BorderedText(
                          strokeColor: Colors.black,
                          strokeWidth: 6.0,
                          child: Text(
                            myItems[index].names,
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          iconSize: 34,
                          color: Colors.white,
                          icon: isplaying == index? Icon(Icons.stop, color: Colors.yellow,) : Icon(Icons.play_arrow),
                          onPressed: () {
                            if(isplaying == index){
                              setState(() {
                                isplaying = null;
                              });
                              audioPlayer.stop();
                            }
                            else{
                              audioPlayer.setAsset(myItems[index].audioPath);
                              audioPlayer.play();
                              setState(() {
                                isplaying = index;
                              });

                            }


                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
