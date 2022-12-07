import 'package:flutter/material.dart';
import 'package:verinvest_mobile/main.dart';
import '../navigation/hamburger.dart';
import '../navigation/bottom_navbar.dart';
import '../profile/profile.dart';
import '../navigation/verinvest_appbar.dart';
import './models/post.dart';
import './post_card.dart';

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  int posts_count = 99;
  Post dummyPost = Post(
      pk: 1,
      postType: "forum",
      author: "Bakchoomie",
      dateCreated: DateTime.now(),
      title: "Why GOTO is crashing",
      content: "Here's 3 reasons why I think \$GOTO is crashing!",
      upvotes: 10,
      viewers: 50,
      commentsCount: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VerinvestAppbar(),
      drawer: const Hamburger(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                  child: Center(
                    child: Flexible(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            text: "Find ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 24),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Trending ",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(text: "Investment Discussions"),
                            ]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "$posts_count posts available",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search post...",
                            fillColor: Colors.black,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          onChanged: (text) {},
                        ),
                      ),
                      Container(child: Icon(Icons.search)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    PostCard(post: dummyPost),
                    PostCard(post: dummyPost),
                    PostCard(post: dummyPost),
                    PostCard(post: dummyPost),
                    PostCard(post: dummyPost),
                    PostCard(post: dummyPost),
                    PostCard(post: dummyPost),
                    PostCard(post: dummyPost),
                    PostCard(post: dummyPost),
                    PostCard(post: dummyPost),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
