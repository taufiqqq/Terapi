import 'package:flutter/material.dart';

class UserPost extends StatefulWidget {
  const UserPost({super.key});

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  final List<String> comments = [
    'If i start therapy, will it go on forever?',
  ];

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
          const SizedBox(height: 16), // Add a space below the search bar
          // Display user comments using ListView.builder
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return CommentItem(
                  comment: comment,
                  onTapComment: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CommentPage(),
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
              comments.add(userMessage);
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
  final int initialLikes = 6;
  final int initialComments = 1;
  final VoidCallback onTapComment;

  const CommentItem({
    Key? key,
    required this.comment,
    required this.onTapComment,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool isLiked = false;
  int likes = 0;
  int comments = 0;
  List<String> commentList = [];

  @override
  void initState() {
    super.initState();
    likes = widget.initialLikes;
    comments = widget.initialComments;
  }

  void addComment(String newComment) {
    setState(() {
      commentList.add(newComment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('lib/assets/img/user_picture.jpg'),
      ),
      title: const Text(
        'Mr Azli Azih',
        style: TextStyle(
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
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace these values with your actual data
    const profileImage = AssetImage('lib/assets/img/therapist-2.jpg');
    const username = 'En Karim Anwar'; // Replace with actual username
    final comments = [
      'The frequency and duration are ultimately up to the patient',
    ];

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
        itemCount: comments.length,
        itemBuilder: (context, index) {
          final comment = comments[index];
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
