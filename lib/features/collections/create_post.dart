import 'package:flutter/material.dart';
import 'models/post.dart';
import '../../core/theme/base_colors.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _formKey = GlobalKey<FormState>();

  late String _type;
  late String _title;
  late String _content;

  @override
  void initState() {
    _type = "";
    _title = "";
    _content = "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
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
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Row(
                            children: const [
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
                          "Create Post",
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
                      top: 12, bottom: 12, left: 12, right: 12),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: const Text("Make a new post",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.normal)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Select post type",
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _type = "forum";
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 36, top: 4, bottom: 4),
                                  child: Row(
                                    children: [
                                      Radio(
                                        value: "forum",
                                        groupValue: _type,
                                        onChanged: (value) {},
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      const Text("Forum"),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _type = "education";
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 36, top: 4, bottom: 4),
                                  child: Row(
                                    children: [
                                      Radio(
                                        value: "education",
                                        groupValue: _type,
                                        onChanged: (value) {},
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      const Text("Article"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        // Title
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Title",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Enter title here...",
                                prefixIcon: const Icon(Icons.title),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            onChanged: (String? value) {
                              setState(() {
                                _title = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _title = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Title cannot be empty!";
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        // Content
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Content",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 6,
                            decoration: InputDecoration(
                                hintText: "Enter content here...",
                                prefixIcon: const Icon(Icons.post_add),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            onChanged: (String? value) {
                              setState(() {
                                _title = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _title = value!;
                              });
                            },
                            validator: (String? value) {
                              // Content can be empty
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 4),
                        child: TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 16)),
                              backgroundColor: MaterialStateProperty.all(
                                  BaseColors.green[500])),
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                _type != null) {
                              Post post = Post(
                                title: _title,
                                content: _content,
                                postType: _type,
                                dateCreated: DateTime.now(),
                                // TODO update when auth finishes
                                authorUsername: "test_user",
                              );

                              setState(() {});

                              // TODO Send data to web service

                              // Reset form data
                              _formKey.currentState?.reset();

                              // Show message dialog
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: ListView(
                                    padding: const EdgeInsets.only(
                                        top: 30, bottom: 30),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      const Center(
                                          child: Padding(
                                        padding: EdgeInsets.only(bottom: 8.0),
                                        child: Text("Created new post!"),
                                      )),
                                      const SizedBox(height: 10),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Back",
                                            style: TextStyle(fontSize: 16),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Create Post",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
