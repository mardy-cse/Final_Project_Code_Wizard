import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class cplaylist extends StatefulWidget {
  const cplaylist({super.key});

  @override
  State<cplaylist> createState() => _cplaylistState();
}

class _cplaylistState extends State<cplaylist> {
  final videourl= 'https://www.youtube.com/watch?v=982nK2Vdk_o&list=PL_XxuZqN0xVASsjyqiNzgjUWHbDkN2Scy&index=1';
  final videourlq= 'https://www.youtube.com/watch?v=37ihwOpP4PE&list=PL_XxuZqN0xVASsjyqiNzgjUWHbDkN2Scy&index=3';
  final videourl4='https://www.youtube.com/watch?v=NWhvLbIHIqI&list=PL_XxuZqN0xVASsjyqiNzgjUWHbDkN2Scy&index=4';

  late YoutubePlayerController _Cintro;
  late YoutubePlayerController _Csintax;
  late YoutubePlayerController _ConVid4;

  @override
  void initState(){
    final videoID= YoutubePlayer.convertUrlToId(videourl);
    final videoIDq= YoutubePlayer.convertUrlToId(videourlq);
    final videoID4= YoutubePlayer.convertUrlToId(videourl4);
    _Cintro = YoutubePlayerController(initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        )
    );

    _Csintax = YoutubePlayerController(initialVideoId: videoIDq!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        )
    );

    _ConVid4 = YoutubePlayerController(initialVideoId: videoID4!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Video Tutorial',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,

            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    const Text('C Programming language Introduction' ,style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
                    const SizedBox(height: 10,),
                    Card(
                      child: YoutubePlayer(controller: _Cintro,
                        showVideoProgressIndicator: true,
                      ),
                    ),
          
                    const SizedBox(height: 30,),
                    const Text('C Programming Syntex' ,style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
                    const SizedBox(height: 10,),
                    Card(
                      child: YoutubePlayer(controller: _Csintax,
                        showVideoProgressIndicator: true,
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Text('Basic Calculation in C' ,style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
                    const SizedBox(height: 10,),
                    Card(
                      child: YoutubePlayer(controller: _ConVid4,
                        showVideoProgressIndicator: true,
                      ),
                    )
                  ],
                ),
              )
          
            ],
          ),
        )
    );
  }
}