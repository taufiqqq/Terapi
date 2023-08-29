import 'package:flutter/material.dart';

class TherapistPost extends StatefulWidget {
  @override
  _TherapistPostState createState() => _TherapistPostState();
}

class _TherapistPostState extends State<TherapistPost> {
  final List<String> postComments = [
    'If I start therapy, how long will each session last?',
    'What types of therapy approaches are available?',
    'How do I know if therapy is right for me?',
    'Can therapy help with managing anxiety and stress?',
    'What are the benefits of group therapy?'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Therapist Post'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: postComments.length,
              itemBuilder: (context, index) {
                final comment = postComments[index];
                return Column(
                  children: [
                    PostCommentItem(comment: comment),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReplyPage(
                                originalComment: comment,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Reply',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PostCommentItem extends StatefulWidget {
  final String comment;

  const PostCommentItem({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  _PostCommentItemState createState() => _PostCommentItemState();
}

class _PostCommentItemState extends State<PostCommentItem> {
  bool isLiked = false;
  int likes = 6;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('lib/assets/img/user_picture.jpg'),
      ),
      title: Text(
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
                isLiked = !isLiked;
                isLiked ? likes++ : likes--;
              });
            },
          ),
          SizedBox(width: 5),
          Text(likes.toString()),
        ],
      ),
    );
  }
}

class ReplyPage extends StatefulWidget {
  final String originalComment;

  const ReplyPage({
    Key? key,
    required this.originalComment,
  }) : super(key: key);

  @override
  _ReplyPageState createState() => _ReplyPageState();
}

class _ReplyPageState extends State<ReplyPage> {
  final TextEditingController _textController = TextEditingController();
  final List<String> replies = [];

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reply'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('lib/assets/img/user_picture.jpg'),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Mr Azli Azih',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  widget.originalComment,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: replies.length,
              itemBuilder: (context, index) {
                final reply = replies[index];
                return ReplyItem(reply: reply);
              },
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    // Placeholder for like functionality
                  },
                  icon: Icon(Icons.favorite_outline),
                ),
                IconButton(
                  onPressed: () {
                    // Placeholder for share functionality
                  },
                  icon: Icon(Icons.share),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Add a reply...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    final newReply = _textController.text;
                    if (newReply.isNotEmpty) {
                      setState(() {
                        replies.add(newReply);
                        _textController.clear();
                      });
                    }
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReplyItem extends StatelessWidget {
  final String reply;

  const ReplyItem({Key? key, required this.reply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('lib/assets/img/therapist-2.jpg'),
              ),
              SizedBox(width: 10),
              Text(
                'En Karim Anwar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(reply, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
