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
  ScrollController scrollController = ScrollController();
  bool showBackToTop = false;

  late int posts_count = 99;
  late String _query;
  late bool forumActive;
  late bool educationActive;

  @override
  void initState() {
    _query = "";
    forumActive = false;
    educationActive = false;

    // Add listener to scroll to top button
    scrollController.addListener(() {
      // Back to top button will show on scroll offset 20.0
      double showOffset = 20.0;

      if (scrollController.offset > showOffset) {
        setState(() {
          showBackToTop = true;
        });
      } else {
        setState(() {
          showBackToTop = false;
        });
      }
    });

    super.initState();
  }

  void _queryHandler(String query) {
    setState(() {
      _query = query;
    });
  }

  void toggleForumFilter() {
    setState(() {
      forumActive = !forumActive;
    });
  }

  void toggleEducationFilter() {
    setState(() {
      educationActive = !educationActive;
    });
  }

  Post forumDummy = Post(
      pk: 1,
      postType: "forum",
      author: "Silverman Sachs",
      dateCreated: DateTime.now(),
      title:
          "Why \$GOTO is crashing, and Indonesia's tech sector is up for a wild ride in 2023. Lorem ipsum dolor sit amet, lorem ipsum dolor sit amet.",
      content:
          "Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing! Here's 3 reasons why I think \$GOTO is crashing!",
      upvotes: 3,
      viewers: 50,
      commentsCount: 0);

  Post educationDummy = Post(
    pk: 2,
    postType: "education",
    author: "Debit Suisse",
    dateCreated: DateTime.now(),
    title: "Why \$BUKA is the best stock!",
    content:
        "Forget \$GOTO, buy your \$BUKA stocks instead! Forget \$GOTO, buy your \$BUKA stocks instead! Forget \$GOTO, buy your \$BUKA stocks instead! Forget \$GOTO, buy your \$BUKA stocks instead! Forget \$GOTO, buy your \$BUKA stocks instead! Forget \$GOTO, buy your \$BUKA stocks instead! Forget \$GOTO, buy your \$BUKA stocks instead! Forget \$GOTO, buy your \$BUKA stocks instead! Forget \$GOTO, buy your \$BUKA stocks instead! Forget \$GOTO, buy your \$BUKA stocks instead! Forget \$GOTO, buy your \$BUKA stocks instead!",
    upvotes: 90,
    viewers: 5200,
    commentsCount: 13,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const VerinvestAppbar(),
      drawer: const Hamburger(),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Flexible(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text: "Find ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 30),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Trending ",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: "Investment Discussions",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400)),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  // TODO delete
                  Text("Query input: $_query"),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      "$posts_count posts available",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SearchCollection(
                    queryHandler: _queryHandler,
                    itemWidth: 320,
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        // padding: EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: toggleForumFilter,
                              child: MenuOption(
                                text: "Forums",
                                iconData: Icons.forum,
                                selected: forumActive,
                              ),
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: toggleEducationFilter,
                              child: MenuOption(
                                text: "Articles",
                                iconData: Icons.school,
                                selected: educationActive,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
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
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: showBackToTop ? 1.0 : 0.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: FloatingActionButton(
            onPressed: () {
              scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.fastOutSlowIn);
            },
            child: const Icon(Icons.arrow_upward),
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
