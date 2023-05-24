class Song {
  final String djname ;
  final String songtitle ;
  final String url ;
  final String coverUrl ;
  Song ( {

    required this.djname ,
    required this.songtitle ,
    required this.url ,
    required this.coverUrl ,
  });

  static List<Song> songs= [
    Song(
      djname: 'DJ NASH TUNIC',
      songtitle: 'The Purge Mix',
      url: 'lib/assets/music/rema.mp3',
      coverUrl: 'lib/assets/images/djfesta.jpg',
    ),
    Song(
      djname: 'DJ MUKEKU',
      songtitle: 'Soulful Mixtape',
      url: 'https://markiniltd.com/lr/audio/djluckydub.mp3',
      coverUrl: 'lib/assets/images/djtopaz.jpg',
    ),
    Song(
      djname: 'DJ EYAN',
      songtitle: 'Baddest Mixtape',
      url: 'lib/assets/mixes/beat.mp3',
      coverUrl: 'lib/assets/images/djrudeboy.jpg',
    ),

  ];
}

















class Video {
  final String djname ;
  final String songtitle ;
  final String url ;
  final String coverUrl ;
  Video ( {

    required this.djname ,
    required this.songtitle ,
    required this.url ,
    required this.coverUrl ,
  });

  static List<Video> videos= [
    Video(
      djname: 'DJ NASH TUNIC',
      songtitle: 'The Purge Mix',
      url: 'lib/assets/mixes/beat.mp3',
      coverUrl: 'lib/assets/images/djnickdee.jpg',
    ),
    Video(
      djname: 'DJ MUKEKU',
      songtitle: 'Soulful Mixtape',
      url: 'lib/assets/mixes/dior.mp3',
      coverUrl: 'lib/assets/images/djdoublem.jpg',
    ),
    Video(
      djname: 'DJ EYAN',
      songtitle: 'Baddest Mixtape',
      url: 'lib/assets/mixes/dound.mp3',
      coverUrl: 'lib/assets/images/djrudeboy.png',
    ),

  ];
}