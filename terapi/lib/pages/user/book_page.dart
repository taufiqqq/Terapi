import 'package:flutter/material.dart';
import 'book_samples.dart';
import 'book_item.dart';

class EbookPage extends StatelessWidget {
  const EbookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true, // Center align title
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
        title: Text(
          'E-book',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade100)),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              PopularBookSection(popularBookSamples),
              SizedBox(height: 20.0),
              NewBookSection(newBookSamples),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularBookSection extends StatelessWidget {
  final List<BookSample> books;

  PopularBookSection(this.books);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          height: 240.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              return Container(
                width: 180.0,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: PopularBookItem(
                  title: books[index].title,
                  author: books[index].author,
                  imageUrl: books[index].imageUrl,
                  summary: books[index].summary,
                  textForPages: books[index].page1Text,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


class NewBookSection extends StatelessWidget {
  final List<BookSample> books;

  NewBookSection(this.books);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New Arrival',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.0),
        Column(
          children: books.map((book) {
            return NewBookItem(
              title: book.title,
              author: book.author,
              imageUrl: book.imageUrl,
              summary: book.summary,
              textForPages: book.page1Text,
            );
          }).toList(),
        ),
      ],
    );
  }
}
