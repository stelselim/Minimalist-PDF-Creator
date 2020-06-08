import 'dart:convert';

import 'package:http/http.dart';

const data = """
https://www.youtube.com/watch?v=nRUTgBg_Zy4
https://www.youtube.com/watch?v=nRUTgBg_Zy4
https://www.youtube.com/watch?v=vpJRAdFnwas
https://www.youtube.com/watch?v=0ComN8ABymk
https://www.youtube.com/watch?v=fKH0cWm5_ow
https://www.youtube.com/watch?v=3umx3oXUYPo
https://www.youtube.com/watch?v=lpvxkuDSMPQ""";


void main() async {
  var ar = data.split("\n");
  var r = [];
  var videos = [];
  ar.forEach((element) {
    element =
        //'"' + element.substring(element.length - 11, element.length) + '"';
        element.substring(element.length - 11, element.length);
    r.add(element);
  });

  r.forEach((item) async {
    var x = await get(
        "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=$item&key=AIzaSyCrT6M-6MM525QM4XM2zYANKonB5MzPLHU");
    final data = jsonDecode(x.body);
    var name = data["items"][0]["snippet"]["title"];
    var id = item;

    final toAdd = {
      "id": '"$id"',
      "name": '"$name"',
    };
    videos.add(toAdd);
    print("\n\n");
     print(videos);

  });
}
