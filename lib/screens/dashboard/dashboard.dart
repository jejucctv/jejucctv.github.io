// import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:http/http.dart' as http;
// import 'package:file_picker_web/file_picker_web.dart' as webPicker;

// import 'dart:async' show Future;
// import 'dart:convert';
// import 'dart:html' as webFile;
// import 'package:provider/provider.dart';

class CctvUrl {
  String name;
  String url;

  CctvUrl(this.name, this.url);
}

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

// class Players extends ChangeNotifier {
//   List<VideoPlayerController> _players = [];

//   void addPlayer(VideoPlayerController video, int i) {
//     video.initialize().then((_) {
//       _players.elementAt(i).setVolume(0);
//       _players.elementAt(i).play();
//     }).catchError((o) {
//       print('error($i): $o');
//       _players.elementAt(i).pause();
//     });
//     _players.add(video);
//     if (i == _players.length) {
//       // notifyListeners();
//     }
//   }
// }

// class Dashboard extends StatelessWidget {
//   final urls = [
//     CctvUrl("제주공항", "http://123.140.197.51/stream/33/play.m3u8"),
//     CctvUrl("용두암 해안", "http://59.8.86.15:1935/live/51.stream/playlist.m3u8"),
//     CctvUrl("탑동", "http://59.8.86.15:1935/live/52.stream/playlist.m3u8"),
//     CctvUrl("서귀포 항", "http://123.140.197.51/stream/35/play.m3u8"),
//     CctvUrl("법환포구", "http://59.8.86.15:1935/live/54.stream/playlist.m3u8"),
//     CctvUrl("법환 해안", "http://59.8.86.15:1935/live/55.stream/playlist.m3u8"),
//     CctvUrl("중문 해안", "http://59.8.86.15:1935/live/59.stream/playlist.m3u8"),
//     CctvUrl("성산일출봉", "http://123.140.197.51/stream/34/play.m3u8"),
//     CctvUrl("온평 해안", "http://59.8.86.15:1935/live/56.stream/playlist.m3u8"),
//     CctvUrl("신창 해안", "http://59.8.86.15:1935/live/63.stream/playlist.m3u8"),
//     CctvUrl("화순 해안", "http://59.8.86.15:1935/live/60.stream/playlist.m3u8"),
//     CctvUrl("백록담",
//         "http://119.65.216.155:1935/live/cctv01.stream_360p/playlist.m3u8"),
//     CctvUrl("왕관릉",
//         "http://119.65.216.155:1935/live/cctv02.stream_360p/playlist.m3u8"),
//     CctvUrl("윗세오름",
//         "http://119.65.216.155:1935/live/cctv03.stream_360p/playlist.m3u8"),
//     CctvUrl("어승생악",
//         "http://119.65.216.155:1935/live/cctv04.stream_360p/playlist.m3u8"),
//     CctvUrl("1100도로",
//         "http://119.65.216.155:1935/live/cctv05.stream_360p/playlist.m3u8"),
//   ];

//   final _version = '0.0.6+5';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ChangeNotifierProvider<Players>(
//         create: (context) => Players(),
//         child: CustomScrollView(
//           slivers: <Widget>[
//             SliverAppBar(
//               title: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.only(left: 32),
//                       child: Text(
//                         "제주도 CCTV",
//                         style: TextStyle(
//                           fontSize: 24,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ]),
//               actions: <Widget>[
//                 Container(
//                     child: IconButton(
//                   icon: Icon(Icons.more_vert),
//                   onPressed: () => showAlertDialog(context, '버전: $_version'),
//                 )),
//                 SizedBox(width: 10),
//               ],
//               backgroundColor: Colors.lightBlue,
//             ),
//             SliverGrid(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: getCountInRow(),
//                 childAspectRatio: 1.7,
//               ),
//               delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     elevation: 5,
//                     margin:
//                         EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
//                     child: Stack(
//                       children: <Widget>[
//                         // Container(
//                         //   child: Text('로딩 중'),
//                         //   // margin: EdgeInsets.only(top: 13, right: 10),
//                         //   alignment: Alignment.center,
//                         // ),
//                         Container(
//                             padding: EdgeInsets.all(5),
//                             child: getVideoPlayer(context, index)),
//                         Container(
//                           child: getName(index),
//                           margin: EdgeInsets.only(top: 13, right: 10),
//                           alignment: Alignment.topRight,
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 childCount: 16,
//               ),
//             ),
//             SliverFillRemaining(
//                 hasScrollBody: false,
//                 child: Container(
//                     color: Colors.grey[200],
//                     padding: EdgeInsets.all(20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(height: 10),
//                         Linkify(
//                           text:
//                               "Made by https://sh0seo.github.io | Mail: ssh0702@gmail.com",
//                           style: TextStyle(
//                             fontSize: 12,
//                           ),
//                           onOpen: (link) async {
//                             await launch(link.url);
//                           },
//                         ),
//                         SizedBox(height: 5),
//                         Text('Copyright© Jejucctv.site All Rights Reserved',
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.bold,
//                             )),
//                         SizedBox(height: 5),
//                         Text(
//                           _version,
//                           style: TextStyle(
//                             fontSize: 9,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                       ],
//                     )))
//           ],
//         ),
//       ),
//     );
//   }

//   void showAlertDialog(BuildContext context, String message) async {
//     return await showDialog<void>(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('제주도 CCTV'),
//             content: Text(message),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('확인'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               )
//             ],
//           );
//         });
//   }

//   void initializeVideoPlayer() {
//     for (int i = 0; i < urls.length; i++) {
//       try {
//         VideoPlayerController video = VideoPlayerController.network(urls[i].url)
//           ..initialize().then((_) {
//             if (getSupported()) {
//               players.elementAt(i).setVolume(0);
//               players.elementAt(i).play();
//               // if (urls.length == i) {
//               //   setState(() {});
//               // }
//             }
//           }).catchError((o) => print('!! $o ${urls[i].url}'));
//         players.add(video);
//       } catch (e) {
//         print(e);
//       }
//     }
//   }

//   VideoPlayer getVideoPlayer(BuildContext context, int index) {
//     try {
//       VideoPlayerController video =
//           VideoPlayerController.network(urls[index].url);
//       context.watch<Players>().addPlayer(video, index);
//       return VideoPlayer(video);
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   Text getName(int index) {
//     if (index > 15) {
//       throw ('$index is over');
//     }
//     return Text(
//       urls[index].name,
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 15,
//         color: Colors.white,
//       ),
//       textAlign: TextAlign.right,
//     );
//   }

//   int getCountInRow() {
//     var targetPlatform = defaultTargetPlatform;
//     if (targetPlatform == TargetPlatform.android) {
//       return 1;
//     } else if (targetPlatform == TargetPlatform.iOS) {
//       return 1;
//     }
//     return 4;
//   }

//   bool getSupported() {
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.windows:
//         return true;
//       case TargetPlatform.macOS:
//         return true;
//       case TargetPlatform.linux:
//         return true;
//       case TargetPlatform.android:
//         return true;
//       default:
//         return true;
//     }
//   }
// }

class DashboardState extends State<Dashboard> {
  final urls = [
    CctvUrl("제주공항", "http://123.140.197.51/stream/33/play.m3u8"),
    CctvUrl("용두암 해안", "http://59.8.86.15:1935/live/51.stream/playlist.m3u8"),
    CctvUrl("탑동", "http://59.8.86.15:1935/live/52.stream/playlist.m3u8"),
    CctvUrl("서귀포 항", "http://123.140.197.51/stream/35/play.m3u8"),
    CctvUrl("법환포구", "http://59.8.86.15:1935/live/54.stream/playlist.m3u8"),
    CctvUrl("법환 해안", "http://59.8.86.15:1935/live/55.stream/playlist.m3u8"),
    CctvUrl("중문 해안", "http://59.8.86.15:1935/live/59.stream/playlist.m3u8"),
    CctvUrl("성산일출봉", "http://123.140.197.51/stream/34/play.m3u8"),
    CctvUrl("온평 해안", "http://59.8.86.15:1935/live/56.stream/playlist.m3u8"),
    CctvUrl("신창 해안", "http://59.8.86.15:1935/live/63.stream/playlist.m3u8"),
    CctvUrl("화순 해안", "http://59.8.86.15:1935/live/60.stream/playlist.m3u8"),
    CctvUrl("백록담",
        "http://119.65.216.155:1935/live/cctv01.stream_360p/playlist.m3u8"),
    CctvUrl("왕관릉",
        "http://119.65.216.155:1935/live/cctv02.stream_360p/playlist.m3u8"),
    CctvUrl("윗세오름",
        "http://119.65.216.155:1935/live/cctv03.stream_360p/playlist.m3u8"),
    CctvUrl("어승생악",
        "http://119.65.216.155:1935/live/cctv04.stream_360p/playlist.m3u8"),
    CctvUrl("1100도로",
        "http://119.65.216.155:1935/live/cctv05.stream_360p/playlist.m3u8"),
  ];

  final _version = '0.0.6+7';

  List<VideoPlayerController> _players = [];

  @override
  void initState() {
    super.initState();

    initializeVideoPlayer();

    // readVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 32),
                    child: Text(
                      "제주도 CCTV",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
            actions: <Widget>[
              Container(
                  child: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () => showAlertDialog('버전: $_version'),
              )),
              SizedBox(width: 10),
            ],
            backgroundColor: Colors.lightBlue,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getCountInRow(),
              childAspectRatio: 1.7,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Text('로딩 중'),
                        // margin: EdgeInsets.only(top: 13, right: 10),
                        alignment: Alignment.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: getVideoPlayer(index)),
                      Container(
                        child: getName(index),
                        margin: EdgeInsets.only(top: 13, right: 10),
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                );
              },
              childCount: 16,
            ),
          ),
          SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Linkify(
                        text:
                            "Made by https://sh0seo.github.io | Mail: ssh0702@gmail.com",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        onOpen: (link) async {
                          await launch(link.url);
                        },
                      ),
                      SizedBox(height: 5),
                      Text('Copyright© Jejucctv.site All Rights Reserved',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 5),
                      Text(
                        _version,
                        style: TextStyle(
                          fontSize: 9,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  )))
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _players) {
      controller.dispose();
    }

    super.dispose();
  }

  void showAlertDialog(String message) async {
    return await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('제주도 CCTV'),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('확인'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void initializeVideoPlayer() {
    for (int i = 0; i < urls.length; i++) {
      try {
        VideoPlayerController video = VideoPlayerController.network(urls[i].url)
          ..initialize().then((_) {
            if (getSupported()) {
              _players.elementAt(i).setLooping(true);
              _players.elementAt(i).setVolume(0);
              _players.elementAt(i).play();
              // if (urls.length == i) {
              //   setState(() {});
              // }
            }
          }).catchError((o) => print('!! $o ${urls[i].url}'));
        _players.add(video);
      } catch (e) {
        print(e);
      }
    }
  }

  VideoPlayer getVideoPlayer(int index) {
    return VideoPlayer(_players.elementAt(index));
  }

  Text getName(int index) {
    if (index > 15) {
      throw ('$index is over');
    }
    return Text(
      urls[index].name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.white,
      ),
      textAlign: TextAlign.right,
    );
  }

  int getCountInRow() {
    var targetPlatform = defaultTargetPlatform;
    if (targetPlatform == TargetPlatform.android) {
      return 1;
    } else if (targetPlatform == TargetPlatform.iOS) {
      return 1;
    }
    return 4;
  }

  bool isMobile() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return true;
      case TargetPlatform.iOS:
        return true;
      default:
        return false;
    }
  }

  bool getSupported() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.macOS:
        return true;
      case TargetPlatform.linux:
        return true;
      case TargetPlatform.android:
        return true;
      default:
        return true;
    }
  }
}
// Future<void> readVersion() async {
//   try {
//     var contents = await downloadVersion();
//     Map<String, dynamic> versions = jsonDecode(contents);
//     if (versions.containsKey("version")) {
//       var version = versions["version"];
//       var buildNumber = versions["build_number"];
//       _version = '$version+$buildNumber';
//       setState(() {});
//     }
//   } catch (e) {
//     print(e);
//   }
// }

// Future<String> downloadVersion() async {
//   FilePickerResult result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: ['json'],
//   );
//   for (PlatformFile file in result.files) {
//     print(file.name);
//     if (file.name == 'version.json') {
//       return jsonDecode(file.path);
//     }
//   }
//
//   return "";
// }
// }
