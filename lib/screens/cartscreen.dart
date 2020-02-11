import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    setState(() {
      cartData=null;
    });
  }

  Widget _buildcartData(
      productName, productType, productMRP, productStorePrice) {
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
                      'M.R.P: ₹$productMRP',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: Colors.orange[400]),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Store Price: ₹$productStorePrice',
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
                          curritemqty++;
                        },
                        icon: Icon(Icons.add,size: 20,),
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: (){
                          curritemqty--;
                        },
                        icon: Icon(Icons.remove,size: 20,),
                      )
                    ],
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
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0))
              ),
              child: Row(

                children: <Widget>[
                  Expanded(
                    child:SizedBox(),
                  ),
                  Container(

                    child: Text(
                      "Your Cart($itemcount)",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child:SizedBox(),
                  ),
                ],
              ),
            ),


            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView(
                  primary: false,
                  padding: EdgeInsets.only(
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
                                if (snapshot.data == null) {
                                  return ListView.builder(
                                      primary: false,
                                      shrinkWrap: true,
                                    //  itemCount: snapshot.data.documents.length,
                                      itemCount: 2,
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
                                            _buildcartData("Name 1", "Type 1", "MRP 1", "Store 1"),
                                            _buildcartData("Name 2", "Type 2", "MRP 2", "Store 2"),
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
            SizedBox(height: 10,),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(child: SizedBox(),flex: 1,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(
                          "SubTotal = $subtot Rs"
                      ),
                      Text(
                          "Delivery Charges: $delcharge Rs"
                      ),
                      Text(
                          "Taxes: $surcharge Rs"
                      ),
                      Text(
                          "Total:$totalcost Rs"
                      )

                    ],
                  ),
                  Expanded(child: SizedBox(),flex: 6,)
                ],
              ),
            ),



            MaterialButton(
              onPressed: (){},
              child: Container(
                  color: Colors.red,
                  child: Text("PROCEED TO BUY")
              ),
            ),


          ],
        )
      ),
    );
  }
}
