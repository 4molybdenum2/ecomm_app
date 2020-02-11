import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var cartData;
  int itemcount=0;
  int currcount=0;
  int totalcost=0;
  int currcost=0;
  int subtot=0;
  int surcharge=0;
  int delcharge=0;
  int curritemqty=0;
  String store="";

  @override
  void initState() {
    super.initState();
    setState(() {
     cartData=Firestore.instance.collection('Users/testuser/cart').snapshots();

    });
  }

  Widget _buildcartData(
      productName, productQuantity, productPrice, productType,productID) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding:
        EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
        child: GestureDetector(
            onTap: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productName,
                      style: TextStyle(
                          fontFamily: 'QuickSand',
                          fontSize: 15.0,
                          color: Colors.red[400],
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      productType,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: Colors.orange[400]),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Price: ₹$productPrice',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: Colors.orange[400]),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Store: $store',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: Colors.orange[400]),
                    ),
                  ],
                ),
                Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        color: Colors.red,
                        onPressed: (){
                          currcount=productQuantity+1;
                          Firestore.instance.collection('Users/testuser/cart').document('$productID')
                              .updateData({
                            'quantity':currcount
                          });
                        },
                        icon: Icon(Icons.remove,size: 20,),
                      ),
                      Text(
                        productQuantity.toString(),
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: (){
                          productQuantity--;
                        },
                        icon: Icon(Icons.add,size: 20,),
                      )
                    ],
                  ),
                  RaisedButton(
                    onPressed: () async {
                      Future<void> deleteDoc(String jobId){
                        return Firestore.instance.collection('Users/testuser/cart').document(jobId).delete();
                      }
                      deleteDoc(productID);
                    },
                    //add to cart
                    disabledColor: Colors.red[400],
                    color: Colors.red[400],
                    child: Text('Remove from Cart',
                        style: TextStyle(
                            fontFamily: 'QuickSand',
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  )
                ])
              ],
            )),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Column(
                children: <Widget>[
                Text('Your Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'QuickSand',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )
                    ),
                    SizedBox(height: 10.0),
                      Text('Subtotal: ₹$subtot' , style: textStyle,),
                      Text('Delivery Charges: ₹$delcharge',style: textStyle,),
                      Text('Taxes: ₹$surcharge',style: textStyle,),
                      Text('Total: ₹$totalcost',style: textStyle,)
                    
                  
              ]
              ),
            ),
            SizedBox(
              height: 40.0,
            ),


            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              child: ListView(
                  primary: false,
                  padding: EdgeInsets.only(
                    top: 10.0,
                    left: 25.0,
                    right: 20.0,
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Container(
                          child: StreamBuilder(
                              stream: cartData,
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return ListView.builder(
                                      primary: false,
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.documents.length,
                                      itemBuilder: (context, i) {
                                        return new Column(
                                          children: <Widget>[

//                                            _buildcartData(
//                                                snapshot.data.documents[i]
//                                                    .data['Name'],
//                                                snapshot.data.documents[i]
//                                                    .data['Type'],
//                                                snapshot.data.documents[i]
//                                                    .data['M.R.P'],
//                                                snapshot.data.documents[i]
//                                                    .data['Store Price'])
                                          _buildcartData(snapshot.data.documents[i].data['name'],
                                              snapshot.data.documents[i].data['quantity'],
                                              snapshot.data.documents[i].data['price'],
                                              snapshot.data.documents[i].data['type'],
                                          snapshot.data.documents[i].documentID)
                                          ],
                                        );
                                      });
                                } else {
                                  return new Text('Loading...');
                                }
                              })),
                    ),


                  ]),
            ),
            // SizedBox(height: 10,),
            // Container(
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(child: SizedBox(),flex: 1,),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[

            //           Text(
            //               "SubTotal = $subtot Rs"
            //           ),
            //           Text(
            //               "Delivery Charges: $delcharge Rs"
            //           ),
            //           Text(
            //               "Taxes: $surcharge Rs"
            //           ),
            //           Text(
            //               "Total:$totalcost Rs"
            //           )

            //         ],
            //       ),
            //       Expanded(child: SizedBox(),flex: 6,)
            //     ],
            //   ),
            // ),



            // MaterialButton(
            //   onPressed: (){},
            //   child: Container(
            //       color: Colors.red,
            //       child: Text("PROCEED TO BUY")
            //   ),
            // ),


          ],
        )
      ),
    );
  }
}

 const TextStyle textStyle= TextStyle (
    color: Colors.white,
    fontFamily: 'QuickSand',
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    
  );
