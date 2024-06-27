import 'package:busara/common/styles.dart';
import 'package:busara/model/Provinces.dart';
import 'package:busara/widget/youtube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailPage extends StatelessWidget {
  final Details detail;
  const DetailPage({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // if(constraints.maxWidth > 800) {
      //   return Detail2(list: list);
      // } else {
      return DetailMobile(detail: detail);
      // }
    });
  }
}

class DetailMobile extends StatefulWidget {
  final Details detail;
  const DetailMobile({super.key, required this.detail});

  @override
  State<DetailMobile> createState() => _DetailMobileState();
}

class _DetailMobileState extends State<DetailMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.bottomCenter,
              //     end: Alignment.topCenter,
              //     colors: [
              //       Colors.black,
              //       Colors.transparent,
              //     ],
              //   ),
              // ),
              child: Stack(children: [
                ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10.0)),
                    child: Stack(
                      children: [
                        Image.asset(
                          widget.detail.images.first,
                          fit: BoxFit.cover,
                          height: 245,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Container(
                          height: 245,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: FavoriteButton())
                          ],
                        ),
                        SizedBox(height: 45),
                        Text(
                          widget.detail.title,
                          style: TextStyle(
                              color: textTitleColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 28),
                        ),
                        Text(
                          widget.detail.subTitle,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: bgCategoryField,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Text(
                              widget.detail.category,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 21,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deskripsi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(widget.detail.description),
                  Visibility(
                    visible: widget.detail.videoLink.isNotEmpty,
                    child: SizedBox(
                      height: 14,
                    ),
                  ),
                  Visibility(
                    visible: widget.detail.videoLink.isNotEmpty,
                    child: Text(
                      "Video",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.detail.videoLink.isNotEmpty,
                    child: SizedBox(
                      height: 4,
                    ),
                  ),
                  Visibility(
                    visible: widget.detail.videoLink.isNotEmpty,
                    child: YoutubePlayerWidget(videoUrl: widget.detail.videoLink)),
                  Visibility(
                    visible: widget.detail.videoLink.isNotEmpty,
                    child: Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse(
                            'https://www.youtube.com/results?search_query=' +
                                widget.detail.title),
                        builder: (context, followLink) => Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          bgCategoryField),
                                    ),
                                    onPressed: followLink,
                                    child: Text(
                                      'Buka di YouTube',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                            )),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Gambar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(widget.detail.images[0]),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(widget.detail.images[1]),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(widget.detail.images[2]),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(widget.detail.images[3]),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Link(
                      target: LinkTarget.blank,
                      uri: Uri.parse(
                          'https://www.google.com/search?tbm=isch&q=' +
                              widget.detail.title),
                      builder: (context, followLink) => Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        bgCategoryField),
                                  ),
                                  onPressed: followLink,
                                  child: Text(
                                    'Lihat Semua',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          )),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
