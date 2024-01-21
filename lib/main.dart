import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart'as Io;
void main(){
  WidgetsFlutterBinding.ensureInitialized();
runApp(MaterialApp(home: MinPage(),));}

class MinPage extends StatefulWidget {
  const MinPage({super.key});

  @override
  State<MinPage> createState() => _MinPageState();
}

class _MinPageState extends State<MinPage> {
  late Io.Socket socket;
  @override
  void initState() {
    connect();
    super.initState();
  }
void connect() {
  try {
    socket = io(
      'http://192.168.100.11:4545',
      OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .setExtraHeaders({'foo': 'bar'})
        .build(),
    );
    socket.connect();
    socket.onConnect((data) {
      if (kDebugMode) {
        print("Connected");
      }
      print(socket.connected); // This should print 'true' now
    });
socket.emit("/fuck", "(){}");
 

    
    
  } catch (e) {
    print("Error connecting to the socket: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
              Container(
                color: Colors.red,
                height:60, width:4555,  child:const Center(child: Text("dcklmckm"),))
          ],
        ),
      ),
    );
  }
}