import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import '../navigation/bottom_navbar.dart';
import '../navigation/hamburger.dart';
import '../navigation/verinvest_appbar.dart';
import '../collections/create_post.dart';
import 'fetch_forum.dart';
import 'forum.dart';

class ForumPost extends StatelessWidget {
  const ForumPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VerinvestAppbar(),
      drawer: Hamburger(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Navbar(),
              Center(child: Text("Forum")),
              Forum(),
            ],
          ),
        ),
      ),
    );
  }
}

/*class Forum extends StatefulWidget {
  const Forum({super.key});

  @override
  State<Forum> createState() => _ForumPageState();
}

class _ForumPageState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Forum"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(39, 182, 136, 1),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        ),
        // future builder berisi data 
        body: FutureBuilder(
          future: fetchforum(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column( 
                  children: const [
                    Text(
                      "Forum",
                      style: TextStyle(color: Color.fromARGB(255, 87, 99, 87), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
                
              
            } else {
                var SectionHapticFeedback;
                var BadgeShape;
                return Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => GestureDetector(
                              child: Accordion(
                                maxOpenSections: 2,
                                headerBackgroundColor:
                                    const Color.fromARGB(255, 198, 236, 209),
                                headerBorderRadius: 5,
                                scaleWhenAnimating: true,
                                openAndCloseAnimation: true,
                                headerPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                sectionOpeningHapticFeedback:
                                    SectionHapticFeedback.heavy,
                                sectionClosingHapticFeedback:
                                    SectionHapticFeedback.light,
                                paddingListBottom: 1,
                                paddingListTop: 1,
                                rightIcon: 	const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 20),
                                children: [
                                  AccordionSection(
                                      isOpen: false,
                                      header: Text(
                                        "${snapshot.data![index].fields.title}",
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black),
                                      ),
                                      content: Column(children: [
                                        Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.all(10),
                                            child: Badge(
                                              badgeContent: Text(
                                                "asked by ${snapshot.data![index].fields.username}",
                                                overflow: TextOverflow.visible,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              shape: BadgeShape.square,
                                              badgeColor: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                        Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: const Text(
                                                "Jawaban:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "${snapshot.data![index].fields.comment}",
                                                overflow: TextOverflow.visible,
                                              ),
                                            ), const SizedBox(height: 10,)
                                          ])
                                      ])
                                  )
                                ]
                              )
                        )
                    )
                );
            }

          }
  })
    );
}

Accordion({required int maxOpenSections, required Color headerBackgroundColor, required int headerBorderRadius, required bool scaleWhenAnimating, required bool openAndCloseAnimation, required EdgeInsets headerPadding, required sectionOpeningHapticFeedback, required sectionClosingHapticFeedback, required int paddingListBottom, required int paddingListTop, required Icon rightIcon, required List children}) {}

Badge({required Text badgeContent, required shape, required MaterialColor badgeColor, required BorderRadius borderRadius}) {}
}

AccordionSection({required bool isOpen, required Text header, required Column content}) {
}*/

class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  final _forumMessages = <ForumMessage>[];

  void _submitForumMessage(String message) {
    // Send the forum message to a server to be stored in a database
    // ...

    setState(() {
      _forumMessages.add(ForumMessage(message: message));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter a forum message',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            onSubmitted: (message) {
              if (message != null) {
                _submitForumMessage(message);
              }
            },
          ),
        ),
        for (var forumMessage in _forumMessages)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: forumMessage,
          ),
      ],
    );
  }
}

class ForumMessage extends StatefulWidget {
  final String message;

  const ForumMessage({this.message = ''}) : super();

  @override
  _ForumMessageState createState() => _ForumMessageState();
}

class _ForumMessageState extends State<ForumMessage> {
  final _comments = <String>[];

  void _submitComment(String comment) {
    // Send the comment to a server to be stored in a database

    setState(() {
      _comments.add(comment);
    });
  }

  int _upvotes = 0;

  void _incrementUpvotes() {
    setState(() {
      _upvotes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.message),
        Text('$_upvotes upvotes'),
        IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {
              _incrementUpvotes();
            }),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter a comment',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            onSubmitted: (comment) {
              if (comment != null) {
                _submitComment(comment);

                Text('$_upvotes upvotes');
                IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {
                      _incrementUpvotes();
                    });
              }
            },
          ),
        ),
        for (var comment in _comments)
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(comment),
          ),
      ],
    );
  }
}
