import 'package:flutter/material.dart';

class Review {
  final int rating; // from 1 to 5
  final String comment;

  Review({required this.rating, required this.comment});
}

class ReviewCard extends StatelessWidget {
  final Review review;

  ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(
                review.rating,
                (index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(review.comment),
          ],
        ),
      ),
    );
  }
}

class ViewAllReviewsPage extends StatefulWidget {
  @override
  _ViewAllReviewsPageState createState() => _ViewAllReviewsPageState();
}

class _ViewAllReviewsPageState extends State<ViewAllReviewsPage> {
  List<Review> reviews = [
    Review(rating: 5, comment: 'Great therapist!'),
    Review(rating: 4, comment: 'Helpful sessions.'),
    Review(
        rating: 5,
        comment:
            'Absolutely amazing! The therapist helped me find new perspectives.'),
    Review(
        rating: 5,
        comment:
            'Life-changing sessions! I feel so much better after every appointment.'),
    Review(
        rating: 5,
        comment: 'Highly recommended therapist. A true professional.'),
    Review(
        rating: 5,
        comment: 'Incredibly supportive and understanding. 5 stars!'),
    Review(rating: 5, comment: 'Helpful insights and guidance. Thank you!'),
    Review(
        rating: 5,
        comment: 'Wonderful experience. Ive grown so much with their help.'),
    Review(
        rating: 5, comment: 'A great listener who provided valuable insights.'),
    Review(
        rating: 5,
        comment:
            'Empathetic and skilled. Im grateful for the positive changes.'),
    Review(
        rating: 5,
        comment:
            'Professional and caring. The sessions exceeded my expectations.'),
    Review(
        rating: 3, comment: 'Sessions were okay. Some room for improvement.'),
    Review(rating: 3, comment: 'Found some value, but not entirely satisfied.'),
    Review(
        rating: 3,
        comment: 'Could be better. Expected more from the therapist.'),
    Review(rating: 2, comment: "Didn't meet my expectations. Disappointed."),
    Review(
        rating: 2,
        comment:
            'Struggled to connect with the therapist. Not the best experience.'),
    Review(
        rating: 2,
        comment: "Sessions didn't really help me. A bit frustrated."),
    Review(rating: 1, comment: 'Waste of time and money. Would not recommend.'),
    Review(
        rating: 1,
        comment:
            'Terrible experience. Absolutely no benefit from the sessions.'),
    Review(
        rating: 1,
        comment: 'Unprofessional and ineffective. Strongly advise against.'),
    Review(
        rating: 1, comment: 'Stay away! The therapist is not worth your time.'),
    Review(
        rating: 1,
        comment: 'Felt ignored and misunderstood. Rating reflects that.'),
  ];

  int selectedRatingFilter = 0;

  List<Review> getFilteredReviews() {
    if (selectedRatingFilter == 0) {
      return reviews;
    }
    return reviews
        .where((review) => review.rating == selectedRatingFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Reviews'),
      ),
      body: Column(
        children: [
          DropdownButton<int>(
            value: selectedRatingFilter,
            onChanged: (value) {
              setState(() {
                selectedRatingFilter = value ?? 0;
              });
            },
            items: [0, 1, 2, 3, 4, 5]
                .map((rating) => DropdownMenuItem(
                      value: rating,
                      child:
                          Text(rating == 0 ? 'All Ratings' : '$rating Stars'),
                    ))
                .toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getFilteredReviews().length,
              itemBuilder: (context, index) {
                return ReviewCard(review: getFilteredReviews()[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
