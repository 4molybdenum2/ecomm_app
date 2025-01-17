import 'package:ecomm_app/database_helper/cartdatabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var cartData;
  int itemcount = 0;
  int currcount = 0;
  int totalcost = 0;
  int currcost = 0;
  int subtot = 0;
  int surcharge = 0;
  int delcharge = 0;
  int curritemqty = 0;
  String store = "";
  var data = cartDatabaseProvider.db.getAllItem();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  Widget _buildcartData(productName, productQuantity, productPrice, productType,
      productID, productmrp) {
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
                        onPressed: () async {
                          //

                          currcount=int.parse(productQuantity) - 1;
                          if(currcount==0){
                            await cartDatabaseProvider.db.deleteItemWithId(productID);
                            Toast.show("Removed $productName from cart", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                          }else{
                            await cartDatabaseProvider.db.updateitem(new Item(
                                name: productName,
                                type: productType,
                                quantity: currcount,
                                storeprice: productPrice,
                                mrp: productmrp,
                                id: productID));
                          }

                          setState(() {
                            data = cartDatabaseProvider.db.getAllItem();
                          });
                        },
                        icon: Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                      Text(
                        productQuantity.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: () async {
                          currcount = int.parse(productQuantity) + 1;
                          await cartDatabaseProvider.db.updateitem(new Item(
                              name: productName,
                              type: productType,
                              quantity: currcount,
                              storeprice: productPrice,
                              mrp: productmrp,
                              id: productID));

                          setState(() {
                            data = cartDatabaseProvider.db.getAllItem();
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          size: 20,
                        ),
                      )
                    ],
                  ),
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
              child: Column(children: <Widget>[
                Text('Your Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'QuickSand',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 10.0),
                Text(
                  'Subtotal: ₹$subtot',
                  style: textStyle,
                ),
                Text(
                  'Delivery Charges: ₹$delcharge',
                  style: textStyle,
                ),
                Text(
                  'Taxes: ₹$surcharge',
                  style: textStyle,
                ),
                Text(
                  'Total: ₹$totalcost',
                  style: textStyle,
                )
              ]),
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
                        child: FutureBuilder<List<Item>>(
                          future: data,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Item>> snapshot) {
                            if (snapshot.hasData) {
                              return buildListView(snapshot);
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.red[400],
          foregroundColor: Colors.white,
          child: Icon(Icons.shopping_basket),
        ));
  }

  ListView buildListView(AsyncSnapshot<List<Item>> snapshot) {
    return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Item item = snapshot.data[index];
                                  return new Column(
                                      children: <Widget>[
                                      _buildcartData(
                                      item.name,
                                      item.quantity,
                                      item.storeprice,
                                      item.type,
                                      item.id,
                                      item.mrp)

                                    ]);
                                  },
                              );
  }
}

const TextStyle textStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'QuickSand',
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
);
