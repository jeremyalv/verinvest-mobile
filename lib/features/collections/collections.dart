import 'package:flutter/material.dart';
import 'package:verinvest_mobile/features/collections/menu_option.dart';
import '../navigation/verinvest_appbar.dart';
import '../navigation/hamburger.dart';
import '../navigation/bottom_navbar.dart';

import './models/post.dart';
import '../profile/profile.dart';
import './post_card.dart';
import './search_collection.dart';
import './menu_option.dart';

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  int posts_count = 99;
  String _query = "";

  void _queryHandler(String query) {
    setState(() {
      _query = query;
    });
  }

  @override
  void initState() {
    _query = "";
    super.initState();
  }

  Post forumDummy = Post(
      pk: 1,
      postType: "forum",
      author: "Silverman Sachs",
      dateCreated: DateTime.now(),
      title: "Why \$GOTO is crashing",
      content: "Here's 3 reasons why I think \$GOTO is crashing!",
      upvotes: 3,
      viewers: 50,
      commentsCount: 0);

  Post educationDummy = Post(
    pk: 2,
    postType: "education",
    author: "Debit Suisse",
    dateCreated: DateTime.now(),
    title: "Why \$BUKA is the best stock!",
    content: "Forget \$GOTO, buy your \$BUKA stocks instead!",
    upvotes: 90,
    viewers: 5200,
    commentsCount: 13,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VerinvestAppbar(),
      drawer: const Hamburger(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      "$posts_count posts available",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SearchCollection(
                    queryHandler: _queryHandler,
                  ),
                  SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MenuOption(
                            text: "Discussion Forums",
                            optionIcon: Icon(
                              Icons.forum,
                              size: 28,
                              color: Colors.grey[400],
                            ),
                          ),
                          SizedBox(width: 8),
                          MenuOption(
                            text: "Education Articles",
                            optionIcon: Icon(
                              Icons.school,
                              size: 28,
                              color: Colors.grey[400],
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                      Column(
                        children: [
                          PostCard(post: forumDummy),
                          PostCard(post: educationDummy),
                          PostCard(post: forumDummy),
                          PostCard(post: educationDummy),
                          PostCard(post: forumDummy),
                          PostCard(post: educationDummy),
                          PostCard(post: forumDummy),
                          PostCard(post: educationDummy),
                          PostCard(post: forumDummy),
                          PostCard(post: educationDummy),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
