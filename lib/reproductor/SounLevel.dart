import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

void reproducir(String palabra) async{
  Soundpool pool = Soundpool(streamType: StreamType.notification);
  
  int soundId = await rootBundle.load("sounds/"+palabra+".aac").then((ByteData soundData) {
                return pool.load(soundData);
              });
  int streamId = await pool.play(soundId);
}