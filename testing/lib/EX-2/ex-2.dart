// import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.black87,
        margin: const EdgeInsets.all(50),
        child: Container(
          color: Colors.blueGrey,
          margin: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.music_note,
                    size: 50,
                    color: Colors.white,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30, top: 30, left: 20),
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'RadioHead',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          inherit: false
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: 600,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network('https://ichef.bbci.co.uk/ace/standard/3840/cpsprodpb/892b/live/766d4370-a810-11ef-886b-43492c4fbe4a.jpg',
                
                ),
                
                
              ),
              )
              
                     
              
              ],
          ),
        ),
      ),
    )
  );
}

