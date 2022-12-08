import 'package:flutter/material.dart';
import './models/post.dart';

class PostDetail extends StatefulWidget {
  final Post post;
  const PostDetail({super.key, required this.post});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, bottom: 12, top: 8),
                child: Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.black,
                              size: 28,
                            ),
                            Text("Back")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // Testing only
                decoration: const BoxDecoration(color: Colors.grey),
                child: Center(
                  child: SizedBox(
                    height: 120,
                    child: Hero(
                      // TODO create post hero
                      tag: "Hero",
                      child: Image.asset(
                        'assets/images/verinvest_icon-1.png',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Container(
                  // TODO content
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [Text("CONTENT")],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
