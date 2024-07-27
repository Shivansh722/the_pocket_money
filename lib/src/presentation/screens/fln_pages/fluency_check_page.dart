import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioRecorder extends StatefulWidget {
  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  bool _isRecording = false;
  bool _recorderInitialized = false;
  bool _isPlaying = false;
  String _filePath = '';

  @override
  void initState() {
    super.initState();
    _initRecorder();
    _initPlayer();
  }

  Future<void> _initRecorder() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
    await _recorder.openRecorder();
    setState(() {
      _recorderInitialized = true;
    });
    print('Recorder initialized');
  }

  Future<void> _initPlayer() async {
    await _player.openPlayer();
    print('Player initialized');
  }

  Future<void> _startRecording() async {
    if (!_recorderInitialized) {
      await _initRecorder();
    }

    final dir = await getApplicationDocumentsDirectory();
    _filePath = '${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.aac';
    print('Starting recording to $_filePath');

    try {
      await _recorder.startRecorder(
        toFile: _filePath,
        codec: Codec.aacADTS, // Use a supported codec
      );
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      print('Error starting recorder: $e');
    }
  }

  Future<void> _stopRecording() async {
    print('Stopping recording');
    try {
      await _recorder.stopRecorder();
      setState(() {
        _isRecording = false;
      });
      print('Recording stopped, file saved at $_filePath');
    } catch (e) {
      print('Error stopping recorder: $e');
    }
  }

  Future<void> _playRecording() async {
    if (_filePath.isNotEmpty) {
      print('Playing recording from $_filePath');
      setState(() {
        _isPlaying = true;
      });
      try {
        await _player.startPlayer(
          fromURI: _filePath,
          codec: Codec.aacADTS,
          whenFinished: () {
            setState(() {
              _isPlaying = false;
            });
            print('Playback finished');
          },
        );
      } catch (e) {
        print('Error playing recording: $e');
        setState(() {
          _isPlaying = false;
        });
      }
    }
  }

  Future<void> _stopPlayback() async {
    if (_isPlaying) {
      print('Stopping playback');
      try {
        await _player.stopPlayer();
        setState(() {
          _isPlaying = false;
        });
        print('Playback stopped');
      } catch (e) {
        print('Error stopping playback: $e');
      }
    }
  }

  Future<void> _uploadRecording() async {
    if (_filePath.isNotEmpty) {
      var uri = Uri.parse('http://0.0.0.0:8000/fluency');
      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('audio', _filePath));
      var response = await request.send();
      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('Failed to upload file');
      }
    }
  }

  void _retest() {
    setState(() {
      _filePath = '';
    });
    _startRecording();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Recorder'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(16.0),
            child: Image.asset('assets/mic.gif'), // Replace with your asset
          ),
          if (_filePath.isNotEmpty) ...[
            Card(
              child: ListTile(
                title: Text('Recorded file:'),
                subtitle: Text(_filePath),
                trailing: _isPlaying
                    ? IconButton(
                        icon: Icon(Icons.stop),
                        onPressed: _stopPlayback,
                      )
                    : IconButton(
                        icon: Icon(Icons.play_arrow),
                        onPressed: _playRecording,
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: _uploadRecording,
              child: Text('Upload Recording'),
            ),
          ],
          if (!_isRecording) ...[
            ElevatedButton(
              onPressed: _startRecording,
              child: Text('Start Recording'),
            ),
          ],
          if (_isRecording) ...[
            ElevatedButton(
              onPressed: _stopRecording,
              child: Text('Stop Recording'),
            ),
            ElevatedButton(
              onPressed: _retest,
              child: Text('Retest'),
            ),
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    _player.closePlayer();
    super.dispose();
  }
}
