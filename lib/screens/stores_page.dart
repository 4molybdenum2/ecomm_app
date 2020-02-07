import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoresPage extends StatefulWidget {
  @override
  _StoresPageState createState() => _StoresPageState();
}

class _StoresPageState extends State<StoresPage> {

  var shopData;

 @override
  void initState() { 
    super.initState();
    setState(() {
      shopData = Firestore.instance.collection('shop').snapshots();

      if(shopData==null)
        print('Null');
    });
  }

  // getShopDetails(){
  //   if(shopData!=null){
  //       return StreamBuilder(
  //         stream: shopData,
  //         builder:(context,snapshot)
  //         {
  //           if(snapshot.data!=null)
  //           {
  //             return ListView.builder(
  //               primary: false,
  //               shrinkWrap: true,
  //               itemCount: snapshot.data.documents.length,
  //               itemBuilder: (context,i){
  //                 return new Column(
  //                   children: <Widget>[
  //                     _buildStoreData(snapshot.data.documents[i].data['Name'],snapshot.data.documents[i].data['Type'])
  //                   ],
  //                 );
  //               }
  //               );
  //           }
  //         }
  //         );
  //     }
  //     else{
  //       return new Text('Loading...');
  //     }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0,right: 10.0),
            child: Row(
              children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_back_ios), disabledColor: Colors.white, onPressed: null,),
                  Expanded(child: Row(children: <Widget>[IconButton(icon: Icon(Icons.shopping_cart),disabledColor: Colors.white, onPressed: null,)],mainAxisAlignment: MainAxisAlignment.end,),),
                ],
              ),
            ),
          SizedBox(height: 25.0,),

          Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Row(
                    children: <Widget>[
                    Text(
                    'Stores',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'QuickSand',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ]
              ),
            ),
          SizedBox(height: 40.0,),
          Container(
             height: MediaQuery.of(context).size.height - 185.0,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
             ),

             child: ListView(
               primary: false,
               padding: EdgeInsets.only(left: 25.0, right: 20.0,),
               children: <Widget>[
                 Padding(
                   padding: EdgeInsets.only(top: 45.0),
                   child: Container(
                     height: MediaQuery.of(context).size.height - 300.0,
                     child: StreamBuilder(
                       stream: shopData,
                       builder: (context,snapshot){
                         if(snapshot.data!=null){
                           return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context,i){
                                return new Column(
                                  children: <Widget>[
                                    _buildStoreData(context, snapshot.data.documents[i])
                                  ],
                                );
                              }
                              
                            ); 
                         }
                         else{
                                return new Text('Loading...');
                          }
                       }
                    )
                   ),
                  )
               ]
             ),
          ),
        ],
      )
    );
  }

 //---returns store card---------------------------------------------------------------------------------------------------------
  Widget _buildStoreData(BuildContext context, DocumentSnapshot document){
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.red , width: 1.0, ),borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0,bottom: 15.0),
        child: GestureDetector(
          onTap:null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Text(
                      document['Name'],
                    style: TextStyle(fontFamily: 'QuickSand', fontSize: 15.0, color:Colors.red[400],fontWeight: FontWeight.bold),
                    ) ,
                    SizedBox(height: 5.0),
                     Text(
                    document['Type'],
                    style: TextStyle(fontFamily: 'QuickSand', fontSize: 12.0, color:Colors.orange[400]),
                    ),
                ],
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: null, 
                    disabledColor: Colors.red[400],
                    child: Text(
                      'Shop',
                      style: TextStyle(
                        fontFamily: 'QuickSand',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )),)
                ]
              )
            ],
          ) 
        ),
        ),
    );
  }

  

}