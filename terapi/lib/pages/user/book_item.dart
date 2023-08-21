import 'package:flutter/material.dart';
import 'book_review.dart';

class PopularBookItem extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String summary;
  final String textForPages;

  PopularBookItem({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.summary,
    required this.textForPages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: ClipRRect(
              child: Image.asset(
                imageUrl,
                width: 110.0,
                height: 130.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      author,
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigate to BookReviewPage when "Read Now" button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookReviewPage(
                    title: title,
                    author: author,
                    imageUrl: imageUrl,
                    summary: summary,
                  ),
                ),
              );
            },
            child: Text(
              'Read Now',
              style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewBookItem extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String summary;
  final String textForPages;

  NewBookItem({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.summary,
    required this.textForPages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2.0),
              child: Image.asset(
                imageUrl,
                width: 80.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  author,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 8.0),
                TextButton(
                  onPressed: () {
                    // Navigate to BookReviewPage when "Read Now" button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookReviewPage(
                          title: title,
                          author: author,
                          imageUrl: imageUrl,
                          summary: summary,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Read Now',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
