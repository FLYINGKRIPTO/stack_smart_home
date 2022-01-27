import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stack_smart_home/utils/color.dart';
import 'package:stack_smart_home/utils/space.dart';
import 'package:stack_smart_home/utils/textstyle.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer.withId('music');

  @override
  void initState() {
    super.initState();
    openPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<Playing?>(
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return albumArtWidget(
                  snapshot.data?.audio.audio.metas.image?.path ?? "",
                  snapshot.data?.audio.audio.metas.title ?? "",
                  snapshot.data?.audio.audio.metas.artist ?? "");
            }
            return const CircularProgressIndicator(
              color: BrandColor.accent,
            );
          },
          stream: _assetsAudioPlayer.current,
        ),
        playerControlWidget(
          onPreviousPressed: () {
            _assetsAudioPlayer.previous();
          },
          onPlayPausePressed: () {
            final bool playing = _assetsAudioPlayer.isPlaying.value;
            if (playing) {
              _assetsAudioPlayer.pause();
            } else {
              _assetsAudioPlayer.play();
            }
          },
          onNextPressed: () {
            _assetsAudioPlayer.next();
          },
        )
      ],
    );
  }

  Widget playerControlWidget(
      {required VoidCallback onPreviousPressed,
      required VoidCallback onPlayPausePressed,
      required VoidCallback onNextPressed}) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(
                Icons.skip_previous,
                color: BrandColor.white,
              ),
              onPressed: onPreviousPressed,
            ),
          ),
          _assetsAudioPlayer.builderIsPlaying(builder: (context, isPlaying) {
            return Expanded(
              flex: 1,
              child: SizedBox(
                width: 48,
                height: 48,
                child: Container(
                  child: isPlaying
                      ? IconButton(
                          icon: const Icon(
                            Icons.pause,
                            color: BrandColor.white,
                          ),
                          onPressed: onPlayPausePressed,
                        )
                      : IconButton(
                          icon: const Icon(
                            Icons.play_arrow,
                            color: BrandColor.white,
                          ),
                          onPressed: onPlayPausePressed,
                        ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(color: BrandColor.white)),
                ),
              ),
            );
          }),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(
                Icons.skip_next,
                color: BrandColor.white,
              ),
              onPressed: onNextPressed,
            ),
          ),
        ],
      ),
    );
  }

  Widget albumArtWidget(
      String albumArtUri, String songName, String artistName) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12), //
          child: Image.network(
            albumArtUri,
            height: 30,
            width: 30,
            fit: BoxFit.cover,
          ),
        ),
        horizontalSpace(8.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                songName,
                style: regular.size12,
              ),
              Text(
                artistName,
                style: regular.size10,
              ),
            ],
          ),
        )
      ],
    );
  }

  void openPlayer() async {
    await _assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: 0),
      showNotification: false,
      autoStart: false,
      loopMode: LoopMode.single,
    );
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }
}

final audios = <Audio>[
  Audio(
    'assets/music/audio_one.mp3',
    metas: Metas(
      id: 'Rock',
      title: 'Midnight love',
      artist: 'Girl in red',
      album: 'RockAlbum',
      image: const MetasImage.network('https://picsum.photos/200/300?random=2'),
    ),
  ),
  Audio(
    'assets/music/audio_two.mp3',
    metas: Metas(
      id: 'Country',
      title: 'Country',
      artist: 'Florent Champigny',
      album: 'CountryAlbum',
      image: const MetasImage.network('https://picsum.photos/200/300?random=1'),
    ),
  ),
];
