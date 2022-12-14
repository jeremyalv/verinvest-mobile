import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './models/post.dart';
import '../navigation/verinvest_appbar.dart';
import '../navigation/hamburger.dart';

class SearchCollection extends StatefulWidget {
  final Function queryHandler;
  final double itemWidth;
  const SearchCollection(
      {super.key, required this.queryHandler, required this.itemWidth});

  @override
  State<SearchCollection> createState() => _SearchCollectionState();
}

class _SearchCollectionState extends State<SearchCollection> {
  final _formKey = GlobalKey<FormState>();
  final _queryController = TextEditingController();

  void clearQueryBox() {
    _queryController.clear();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: widget.itemWidth,
            height: 50,
            child: TextField(
              controller: _queryController,
              decoration: InputDecoration(
                hintText: "Search post...",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 12, right: 8),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[500],
                    size: 24,
                  ),
                ),
              ),
              onChanged: (text) {
                widget.queryHandler(text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
