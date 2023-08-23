import 'package:flutter/material.dart';

class ReadBookPage extends StatefulWidget {
  final String bookTitle;
  final String bookAuthor;
  final List<String> bookPages;

  ReadBookPage({
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookPages,
  });

  @override
  _ReadBookPageState createState() => _ReadBookPageState();
}

class _ReadBookPageState extends State<ReadBookPage> {
  final String bookTitle = 'Sample Book Title';
  final String bookAuthor = 'Sample Author';
  final List<String> bookPages = [
    'Welcome to "Exploring Therapy: A Guide to Emotional Well-being." In this ebook, we embark on a journey to unravel the profound impact of therapy on our mental and emotional well-being. Whether you\'re new to the concept or looking to deepen your understanding, this guide provides insights, techniques, and practical exercises to support personal growth.\nTherapy, in its essence, is a collaborative process guided by a trained professional. It\'s a transformative journey that offers a safe space for individuals to address psychological, emotional, and behavioral challenges. Through therapeutic engagement, individuals develop self-awareness, gain coping skills, and pave the way for positive change.',
    'Effective therapy rests on the foundation of a strong therapeutic relationship. This unique bond between therapist and client is cultivated through trust, empathy, and a nonjudgmental atmosphere. This relationship forms the bedrock for open communication, self-exploration, and personal development.\nA diverse array of therapeutic techniques is at the disposal of therapists. These techniques, ranging from cognitive-behavioral strategies to mindfulness exercises, enable individuals to address their specific challenges. Alongside these techniques, psychoeducation equips clients with a deeper understanding of their emotions, thoughts, and behaviors, empowering them to make informed decisions and adopt healthier perspectives.',
    'The world of therapy encompasses a tapestry of approaches, each tailored to distinct needs and preferences. Cognitive-Behavioral Therapy (CBT) is a structured approach that helps individuals identify and modify negative thought patterns, while mindfulness-based therapy encourages present-moment awareness and stress reduction.\nPsychodynamic therapy delves into the unconscious mind to understand how past experiences shape present behaviors. Humanistic therapy, often known as Person-Centered Therapy, emphasizes the importance of self-acceptance and self-actualization. Family therapy, on the other hand, focuses on improving communication and dynamics within familial relationships.\nSelecting the right approach involves a collaborative effort between client and therapist. The chosen therapy should align with personal goals and challenges, ensuring a tailored and effective experience. Through a case study of Sarah\'s journey, we\'ll witness firsthand how therapy can transform lives.',
    'Self-exploration is a fundamental aspect of the therapeutic journey. Engaging in regular self-reflection fosters insight and growth. Take a moment to journal your thoughts, emotions, and aspirations. Reflect on your strengths and areas for improvement. This practice deepens self-awareness and lays the foundation for therapeutic progress.\nMindfulness practice offers a powerful tool for managing stress and enhancing well-being. Close your eyes and focus on your breath, observing its rhythm as you inhale and exhale. This simple exercise brings your attention to the present moment, fostering relaxation and a sense of calm.\nGratitude journaling is a practice that cultivates positivity. Set aside time each day to jot down three things you\'re grateful for. This practice encourages you to notice the small joys in life and shifts your focus toward the positive aspects of your experiences.\nRemember, these exercises are a gateway to self-discovery, and as you continue to explore the realms of therapy, you\'ll uncover a wealth of tools to enrich your emotional well-being.',
    // Add more pages as needed
  ];

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
        title: Text(
          widget.bookTitle, // Set the book title as app bar title
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.bookTitle, // Display the book title
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Text(
                      'By ${widget.bookAuthor}', // Display the book author
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < bookPages.length; i++)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 116, 116, 116)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          bookPages[i],
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${i + 1}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
