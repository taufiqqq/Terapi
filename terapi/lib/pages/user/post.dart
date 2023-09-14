import 'package:flutter/material.dart';

class UserPost extends StatefulWidget {
  const UserPost({Key? key}) : super(key: key);

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  final List<String> comments = [
    'If I start therapy, will it go on forever?',
    'How do I know if therapy is working for me?',
    'What are some techniques to manage anxiety?',
    'I feel overwhelmed. What should I do?',
    'How can I improve my self-esteem?',
  ];

  final List<List<String>> replies = [
    [
      'The frequency and duration are ultimately up to the patient, as some patients are different than others. Try going on 1 appointment per week, and discuss with your therapist regarding your situation and therapy sessions.'
    ],
    [
      'Therapy sessions are tailored to your needs and goals. The duration of therapy varies from person to person. Some individuals may only need a few sessions to address specific concerns, while others may benefit from longer-term therapy. Your therapist will work with you to create a treatment plan that fits your situation and objectives.'
    ],
    [
      'Some techniques to manage anxiety include deep breathing exercises, progressive muscle relaxation, mindfulness meditation, and cognitive-behavioral therapy. It\'s important to find what works best for you, and your therapist can help you develop coping strategies that suit your needs.'
    ],
    [
      'Feeling overwhelmed is common, and it\'s important to take care of yourself. Consider reaching out to a therapist to talk about your feelings and develop strategies to manage them. You can also practice self-care activities like deep breathing, journaling, and engaging in activities you enjoy.'
    ],
    [
      'Improving self-esteem involves challenging negative thoughts, practicing self-compassion, setting achievable goals, and focusing on your strengths. A therapist can provide guidance and support in this process.'
    ],
  ];

  final List<String> usernames = [
    'Mr Azli Azih',
    'Encik Hariman',
    'Azhan Haniff',
    'Am Arul',
    'Hazia Zaini'
  ];

  void _uploadPost(String userMessage) {
    setState(() {
      comments.add(userMessage);
      usernames.add('User ${usernames.length + 1}');
      replies.add([]); // Add an empty list for replies
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SafeArea(
          child: Image.asset(
            'lib/assets/img/TERAPI.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Post',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return CommentItem(
                  comment: comment,
                  username: usernames[index],
                  replies: replies[index],
                  onTapComment: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommentPage(
                          username: 'En Karim Anwar',
                          profileImage:
                              AssetImage('lib/assets/img/therapist-2.jpg'),
                          replies: replies[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final userMessage = await Navigator.push<String>(
            context,
            MaterialPageRoute(
              builder: (context) => const TweetPage(selectedCommentIndex: -1),
            ),
          );

          if (userMessage != null && userMessage.isNotEmpty) {
            setState(() {
              _uploadPost(userMessage);
            });
          }
        },
        backgroundColor: Colors.blue[300],
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TweetPage extends StatelessWidget {
  final int selectedCommentIndex;

  const TweetPage({Key? key, required this.selectedCommentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController userMessageController =
        TextEditingController(); // Initialize the TextEditingController
    String userMessage = userMessageController.text;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SafeArea(
          child: Image.asset(
            'lib/assets/img/TERAPI.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: userMessageController,
              maxLines: 8,
              onChanged: (value) {
                userMessage = value; // Update userMessage when the text changes
              },
              decoration: InputDecoration(
                hintText: 'What\'s on your mind',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.pop(context, userMessage);
            },
            child: const Text('Upload Post'),
          ),
        ],
      ),
    );
  }
}

class CommentItem extends StatefulWidget {
  final String comment;
  final List<String> replies;
  final int initialLikes = 6;
  final int initialComments = 1;
  final VoidCallback onTapComment;
  final String username;

  const CommentItem({
    Key? key,
    required this.username,
    required this.comment,
    required this.replies,
    required this.onTapComment,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool isLiked = false;
  int likes = 0;
  List<String> commentList = [];

  @override
  void initState() {
    super.initState();
    likes = widget.initialLikes;
    commentList = widget.replies;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('lib/assets/img/user_picture.jpg'),
      ),
      title: Text(
        widget.username, // Use the provided username here
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(widget.comment),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
              color: isLiked ? Colors.blue : null,
            ),
            onPressed: () {
              setState(() {
                if (isLiked) {
                  likes--;
                } else {
                  likes++;
                }
                isLiked = !isLiked;
              });
            },
          ),
          const SizedBox(width: 5),
          Text(likes.toString()),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: widget.onTapComment, // Call the callback when tapped
            child: Row(
              children: [
                const Icon(Icons.comment, size: 16),
                const SizedBox(width: 5),
                Text(commentList.length.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentPage extends StatelessWidget {
  final ImageProvider profileImage;
  final String username;
  final List<String> replies;

  const CommentPage({
    super.key,
    required this.profileImage,
    required this.username,
    required this.replies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SafeArea(
          child: Image.asset(
            'lib/assets/img/TERAPI.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: replies.length,
        itemBuilder: (context, index) {
          final comment = replies[index];
          return CommentSection(
            profileImage: profileImage,
            username: username,
            comment: comment,
          );
        },
      ),
    );
  }
}

class CommentSection extends StatelessWidget {
  final ImageProvider profileImage;
  final String username;
  final String comment;

  const CommentSection({
    super.key,
    required this.profileImage,
    required this.username,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: profileImage,
            radius: 30,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(comment),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
