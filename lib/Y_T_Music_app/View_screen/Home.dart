import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:y_t_music/Y_T_Music_app/Provider/Y_T_provider_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Y_T_provider? providerF;
  Y_T_provider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Y_T_provider>(context,listen: false);
    providerT=Provider.of<Y_T_provider>(context,listen: true);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //top
            SizedBox(
              height:6.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("darshan"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white12),
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
            Divider(
              height: 2,
              color: Colors.white,
            ),
            //listen again
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              title: Text("Darshan Sankhat",style: TextStyle(fontSize: 18,color: Colors.white),),
              subtitle: Text("Listen again",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
              trailing: Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white24),
                  color: Colors.black,
                ),
                alignment: Alignment.center,
                child: Text("More",style: TextStyle(color: Colors.white),),
              ),
            ),
            //Listen again music
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                  return Container(
                    height: 500,
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //audio
                        Text("Audio",style: TextStyle(fontSize: 25,color: Colors.white),),
                        //one
                        SizedBox(height: 10,),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                providerT!.choiceIndex=index;
                                Navigator.pushNamed(context, "play",arguments: index);
                              },
                              child: Container(
                                height: 125,
                                width: 125,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red,
                                  image: DecorationImage(image: AssetImage("${providerT!.songList[index].image}")),
                                ),
                              ),
                            ),
                            Icon(Icons.play_arrow,size: 50,),
                          ],
                        ),
                        Text("darshan",style: TextStyle(color: Colors.white,fontSize: 18),),
                        //audio
                        SizedBox(height: 10),
                        Text("Video",style: TextStyle(fontSize: 25,color: Colors.white),),
                        //one
                        SizedBox(height: 10,),
                        //tow
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 125,
                              width: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                                image: DecorationImage(image: AssetImage("${providerT!.songList[index].image}")),
                              ),
                            ),
                            Icon(Icons.play_arrow,size: 50,),
                          ],
                        ),
                        Text("darshan",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ],
                    ),
                  );
                },
                itemCount: 8,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
