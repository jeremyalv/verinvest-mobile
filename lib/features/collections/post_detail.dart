import 'package:flutter/material.dart';
import './models/post.dart';
import 'package:intl/intl.dart';

class PostDetail extends StatefulWidget {
  final Post post;

  const PostDetail({super.key, required this.post});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  ScrollController scrollController = ScrollController();
  bool showBackToTop = false;

  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, bottom: 12, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            height: 50,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.black,
                                  size: 28,
                                ),
                                Text("Back"),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 12),
                          child: Text(
                            "Post Detail",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 36, bottom: 24, left: 24, right: 24),
                    child: Column(
                      children: [
                        Hero(
                          tag: "Hero",
                          child: Column(
                            children: [
                              Text(
                                // TODO update
                                widget.post.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            children: [
                              Text(
                                widget.post.author,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                DateFormat.yMMMEd()
                                    .format(widget.post.dateCreated),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          child: Text(widget.post.content),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, bottom: 8, top: 8),
                    child: Container(
                      // TODO content
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          // TODO reactivate
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              // primary: false,
                              itemCount: 30,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 32, horizontal: 12),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(12))),
                                        child: Text(
                                            "This is a comment, lorem ipsum dolor sit amet")),
                                  ))),
                    ),
                  ),
                ],
              ),
            ],
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
