import 'package:flutter/material.dart';
import 'book_read.dart';

class BookReviewPage extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String summary;

  BookReviewPage({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReadBookPage(
                    bookTitle: title,
                    bookAuthor: author,
                    bookPages: [],
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
        centerTitle: true, // Center align the title in the app bar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Ebook Image
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              child: Image.asset(
                imageUrl,
                width: 150.0,
                height: 230.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 13.0),
            // Title and Author
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5.0),
                  Align(
                    alignment: Alignment.center, // Center the author
                    child: Text(
                      author,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            // Summary Text
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Summary',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    summary,
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
