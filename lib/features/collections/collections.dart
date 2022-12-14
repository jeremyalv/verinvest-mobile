import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../core//services/collections_api.dart';
import '../../core/theme/base_colors.dart';
import '../navigation/verinvest_appbar.dart';
import '../navigation/hamburger.dart';
import '../navigation/bottom_navbar.dart';
import '../profile/profile.dart';

import './models/post.dart';
import './post_card.dart';
import './search_collection.dart';
import './menu_option.dart';
import './create_post.dart';

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  late CollectionsAPI _collectionsAPI = CollectionsAPI();
  late Future<List<Post>> _collections = _collectionsAPI.fetchPosts();

  ScrollController scrollController = ScrollController();
  bool showBackToTop = false;

  late int postsCount = 0;
  late String _query;
  late bool userHasQuery;

  // For sorting by category only
  late bool forumActive;
  late bool educationActive;

  @override
  void initState() {
    _query = "";
    userHasQuery = false;
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

    // Init posts count
    _getPostsCount().then((value) {
      if (value != null) {
        setState(() {
          postsCount = value;
        });
      }
    });

    super.initState();
  }

  Future<int> _getPostsCount() async {
    return await _collections.then((value) => value.length);
  }

  void _queryHandler(String query) {
    setState(() {
      _query = query;
      userHasQuery = true;
    });
  }

  // Sorting in form of filter
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
                          text: TextSpan(
                              text: "Find ",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: BaseColors.black,
                                  fontSize: 30),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Trending ",
                                    style: TextStyle(
                                        color: BaseColors.green[500],
                                        fontWeight: FontWeight.bold)),
                                const TextSpan(
                                    text: "Investment Discussions",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400)),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      "$postsCount posts available",
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
                      FutureBuilder(
                          future: _collections,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.data == null) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (!snapshot.hasData) {
                                return Column(
                                  children: const [
                                    Text(
                                      "Collections is empty",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                );
                              } else {
                                return ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      Post post = snapshot.data[index];
                                      String postType = post.postType;

                                      // Get title and query cleaned data
                                      String titleLowercased =
                                          post.title.toLowerCase().trim();
                                      String queryLowercased =
                                          _query.toLowerCase().trim();
                                      // Filter logic
                                      if (forumActive && !educationActive) {
                                        // Filter logic (2) - by type
                                        if (postType == "forum") {
                                          // Query logic - by user query, if any

                                          // If no query, return the filtered item
                                          if (!userHasQuery) {
                                            return PostCard(
                                              post: post,
                                            );
                                          } else {
                                            // If has query, filter by query
                                            if (titleLowercased
                                                .contains(queryLowercased)) {
                                              return PostCard(
                                                post: post,
                                              );
                                            } else {
                                              return Container();
                                            }
                                          }
                                        } else {
                                          // to avoid errors
                                          return Container();
                                        }
                                      } else if (!forumActive &&
                                          educationActive) {
                                        if (postType == "education") {
                                          // If no query, return the filtered item
                                          if (!userHasQuery) {
                                            return PostCard(
                                              post: post,
                                            );
                                          } else {
                                            // If has query, filter by query
                                            if (titleLowercased
                                                .contains(queryLowercased)) {
                                              return PostCard(
                                                post: post,
                                              );
                                            } else {
                                              return Container();
                                            }
                                          }
                                        } else {
                                          // If no query, return the filtered item
                                          if (!userHasQuery) {
                                            return PostCard(
                                              post: post,
                                            );
                                          } else {
                                            // If has query, filter by query
                                            if (titleLowercased
                                                .contains(queryLowercased)) {
                                              return PostCard(
                                                post: post,
                                              );
                                            } else {
                                              return Container();
                                            }
                                          }
                                        }
                                      } else {
                                        // Else case
                                        return PostCard(
                                          post: post,
                                        );
                                      }
                                    });
                              }
                            }
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SpeedDial(
          childMargin: const EdgeInsets.symmetric(vertical: 20),
          childPadding: const EdgeInsets.symmetric(vertical: 2),
          icon: Icons.menu,
          backgroundColor: BaseColors.green[500],
          children: [
            SpeedDialChild(
              child: const Icon(
                Icons.create,
                color: Colors.white,
              ),
              label: "Create Post",
              backgroundColor: BaseColors.green[500],
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreatePost()));
              },
            ),
            SpeedDialChild(
                label: "Refresh page",
                backgroundColor: BaseColors.green[500],
                child: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget));
                }),
            SpeedDialChild(
              label: "Back to top",
              backgroundColor: BaseColors.green[500],
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
              onTap: () {
                scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.fastOutSlowIn);
              },
            )
          ],
        ),
      ),
    );
  }
}
