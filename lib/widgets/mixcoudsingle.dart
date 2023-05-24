import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:liverequest/widgets/playerbuttons.dart';
import 'package:liverequest/widgets/seekbar.dart';


import 'package:rxdart/rxdart.dart' as rxdart;

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';


import 'songmodel.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}
class _SongScreenState extends State<SongScreen>{
  AudioPlayer audioPlayer= AudioPlayer();
  Song song=Get.arguments ?? Song.songs[0];




  @override

  void initState(){
    super.initState();

    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(children: [
       // AudioSource.uri(Uri.parse('asset:///${song.url}'),),
        AudioSource.uri(Uri.parse('/${song.url}'),),
      ],
      ),

    );
  }

  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream,
          audioPlayer.durationStream,
              (Duration position,Duration? duration,){
            return SeekBarData(position, duration ??  Duration.zero,);

          }
      );


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation:0,
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Image.asset(
                song.coverUrl,
                fit: BoxFit.cover,
              ),
            ),
            const BackgroundFilter(),
            _MusicPlayer(
                song:song,

                seekBarDataStream: _seekBarDataStream,
                audioPlayer: audioPlayer),


          ],
        ),
      ),


    );
  }

}

class _MusicPlayer extends StatelessWidget {
  const _MusicPlayer({
    Key? key,
    required this.song,

    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
  }) : _seekBarDataStream = seekBarDataStream, super(key: key);

  final Song song;

  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.songtitle,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            song.djname,
            maxLines:2,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),

          ),
          const SizedBox(height: 30,),
          StreamBuilder<SeekBarData>(

              stream: _seekBarDataStream,

              builder: (context, snapshot){

                final positionData = snapshot.data;
                return SeekBar(
                  position: positionData?.position ??  Duration.zero,
                  duration: positionData?.duration ?? Duration.zero,
                  onChangedEnd: audioPlayer.seek,
                );

              }),
          PlayerButtons(audioPlayer: audioPlayer),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(iconSize: 35, onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined,color: Colors.white,),),
              IconButton(iconSize: 35, onPressed: (){}, icon: const Icon(Icons.cloud_download,color: Colors.white,),),
            ],
          )
        ],
      ),
    );
  }
}



class BackgroundFilter extends StatelessWidget {
  const BackgroundFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect){
        return LinearGradient(

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            colors: [

              Colors.white,
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.0),

            ],
            stops: const [
              0.0,
              0.4,
              0.6
            ]).createShader(rect);

      },
      blendMode: BlendMode.dstOut,
      child: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(

              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

              colors: [

                Colors.deepPurple.shade200,
                Colors.deepPurple.shade800,
              ]
          ),
        ),

      ),
    );
  }
}

