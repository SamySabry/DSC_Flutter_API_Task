import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:apiapp/models/post.dart';
import 'package:apiapp/utilities/connect.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Connect conn=Connect();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("messenger",style: TextStyle(
          fontSize: 20
        ),),
      ),
      body: Center(
        child:
        FutureBuilder<List<Post>>(
          future: conn.fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Post> data = snapshot.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return
                      Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: Card(
                          child: Container(
                            color: Colors.white,
                    child: ListTile(
                            title:  Text(data[index].name),
                                  leading:CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        data[index].picture +'/'+data[index].index.toString()+'.jpg'
                                    ),
                                  ),
                                  subtitle: Text(data[index].company),
                          ),
                          ),
                        ),








                        secondaryActions: <Widget>[
                          SlideAction(
                            child: Icon(Icons.line_weight,size: 40,color: Colors.black,),
                            color: Colors.white70,
                            onTap: () => debugPrint("list"),
                          ),
                          SlideAction(
                            child: Icon(Icons.notifications,size: 40,color: Colors.black,),
                            color: Colors.black12,
                            onTap: () => debugPrint("not"),
                          ),
                          SlideAction(
                            child: Icon(Icons.delete,size: 40,color: Colors.white,),
                            color: Colors.red,
                            onTap: () => debugPrint("delete"),
                          )

                        ],
                      );

//                      Dismissible(
//                      child: Card(
//                        child: ListTile(
//                          title:  Text(data[index].name),
//                                leading:CircleAvatar(
//                                  backgroundImage: NetworkImage(
//                                      data[index].picture +'/'+data[index].index.toString()+'.jpg'
//                                  ),
//                                ),
//                                subtitle: Text(data[index].company),
//                        ),
//                      ),
////                      background: Container(
////                        color: Colors.white,
////                        child: Card(
////                          child: Row(
////                            mainAxisAlignment: MainAxisAlignment.end,
////                            children: <Widget>[
////                                  Container(
////                                    width: 50,
////                            child:
////                            IconButton(icon :Icon(Icons.line_weight,size: 40,),),
////                                color: Colors.white70,
////                                  ),
////
////
////                              Container(
////                                width: 50,
////                                child:
////                                IconButton(icon :Icon(Icons.notifications,size: 40,),),
////                                color: Colors.white10,
////                              ),
////                              Container(
////                                width: 50,
////                                child:
////                                IconButton(icon :Icon(Icons.delete_outline,size: 40,),),
////                                color: Colors.red,
////                              ),
////                            ],
////                          ),
////                        ),
////                      ),
//                      key: ValueKey(data[index].index),
//                        //direction: DismissDirection.endToStart,
//    onDismissed: (direction) {
//      // Remove the item from the data source.
//    }
//
//    );
                  });(data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        )

      ),
    );
  }
}













//                    ListView.builder(
//                    itemCount: values.length,
//                    itemBuilder: (BuildContext context, int index) {
//                      return new ListView(
//                        children: <Widget>[
//                          new ListTile(
//                            title: new Text(values[index].title),
//                            leading:Text(values[index].body),
//                            trailing: Text(values[index].id.toString()),
//                            subtitle: Text(values[index].userId.toString()),
//                          ),
//                          // new Divider(height: 2.0,),
//                        ],
//                      );
//                    },
//                  );


