import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';


class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    // Call _updateTime method when the widget is first initialized
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      // Get the current time
      DateTime now = DateTime.now();
      // Format the current time
      _currentTime = DateFormat('MMMM d, y hh:mm a').format(now);
    });

    // Update the time every second
    Future.delayed(Duration(seconds: 1), _updateTime);
  }

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        // Do something with the picked image (e.g., save it, display it)
        print('Image picked: ${pickedImage.path}');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Implement share functionality here
            },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Item 1'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('Item 2'),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text('Item 3'),
                  value: 3,
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_currentTime), // Display current time
          TextField(
            decoration: InputDecoration(
              hintText: 'Title',
            ),
          ), // Title input
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              maxLines: null,
              expands: true,
              decoration: InputDecoration(
                hintText: 'Note',
                border: OutlineInputBorder(),
              ),
            ), // Note details
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.photo_album),
              onPressed: _pickImageFromGallery,
            ),
            IconButton(
              icon: Icon(Icons.playlist_add),
              onPressed: () {
                // Navigate to todo list
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Navigate to reminder
              },
            ),
          ],
        ),
      ),
    );
  }
}
