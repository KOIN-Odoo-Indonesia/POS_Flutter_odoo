import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _amountController = TextEditingController();
  int _currentAmount = 1;
  int _currentCategory = 1;
  multi(x, y) => x * y;
  double charge = 0.00;

  List categories = [
    {
      "id": 1,
      "title": "big cloth",
    },
    {
      "id": 2,
      "title": "small cloth",
    },
    {
      "id": 3,
      "title": "long cloth",
    },
    {
      "id": 4,
      "title": "short cloth",
    },
    {
      "id": 5,
      "title": "super long and short cloth",
    }
  ];

  List products = [
    {
      "id": 1,
      "title": "Product 1",
      "price": 10.00,
      "stock": 1,
      "category": {
        "id": 1,
        "title": "category 1",
      },
      "image": {
        "id": 1,
        "link":
            "http://lazio.dunebuggysrl.netdna-cdn.com/media/catalog/category/laz-gk.jpg"
      }
    },
    {
      "id": 2,
      "title": "Product 2",
      "price": 20.00,
      "stock": 2,
      "category": {
        "id": 2,
        "title": "category 2",
      },
      "image": {
        "id": 2,
        "link":
            "http://lazio.dunebuggysrl.netdna-cdn.com/media/catalog/category/laz-home.jpg"
      }
    },
    {
      "id": 3,
      "title": "Product 3",
      "price": 30.00,
      "stock": 3,
      "category": {
        "id": 3,
        "title": "category 3",
      },
      "image": {
        "id": 3,
        "link":
            "http://lazio.dunebuggysrl.netdna-cdn.com/media/catalog/product/cache/2/small_image/350x/17f82f742ffe127f42dca9de82fb58b1/l/z/lz18227.jpg"
      }
    },
    {
      "id": 4,
      "title": "Product 4",
      "price": 40.00,
      "stock": 4,
      "category": {
        "id": 4,
        "title": "category 4",
      },
      "image": {
        "id": 4,
        "link":
            "http://www.magliecalciobassocosto.com/images/image/Thailandia%20Terza%20Maglia%20Lazio%202018-2019%20Nero-magliecalciobassocosto.com.jpg"
      }
    },
    {
      "id": 5,
      "title": "Product 5",
      "price": 50.00,
      "stock": 5,
      "category": {
        "id": 5,
        "title": "category 5",
      },
      "image": {
        "id": 5,
        "link":
            "http://lazio.dunebuggysrl.netdna-cdn.com/media/catalog/category/donna.jpg"
      }
    },
  ];

  List carts = List();

  void _addToCart(dynamic product) {
    dynamic newproduct = {
      "id": product['id'],
      "title": product['title'],
      "price": product['price'],
      "amount": _currentAmount,
      "category": product['category'],
    };
    setState(() {
      carts.add(newproduct);
    });
    _resetAmount();
    _calculateCharge();
  }

  void _removeFromCart(int id) {
    setState(() {
      carts.removeAt(id);
    });
    _calculateCharge();
  }

  void _calculateCharge() {
    double _charge = 0.00;
    carts.forEach((cart) {
      _charge += cart['price'] * cart['amount'];
    });
    print(_charge);
    setState(() {
      charge = _charge;
    });
  }

  void _resetAmount() {
    setState(() {
      _amountController.text = '1';
      _currentAmount = 1;
    });
  }

  void _filterByCategory(int id) {
    setState(() {
      _currentCategory = id;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _resetAmount();
  }

  @override
  Widget build(BuildContext context) {
    final _HEIGHT = MediaQuery.of(context).size.height;
    final _WIDTH = MediaQuery.of(context).size.width;

    print(_WIDTH);

    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        actions: <Widget>[
          IconButton(
            onPressed: () => print("object"),
            icon: Icon(Icons.shopping_basket),
          )
        ],
      ),
      drawer: DrawerWidget(),
      body: Row(
        children: <Widget>[
          /* Products */
          Expanded(
            flex: 8,
            child: Container(
                height: _HEIGHT,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 11,
                      child: GridView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              _addToCart(products[i]);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Container(
                                      width: 100,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: IconButton(
                                              icon: Icon(Icons.remove_circle),
                                              onPressed: () {
                                                setState(() {
                                                  _currentAmount =
                                                      _currentAmount < 2
                                                          ? 1
                                                          : _currentAmount - 1;
                                                  _amountController.text =
                                                      '$_currentAmount';
                                                });
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: TextField(
                                              onChanged: (value) {
                                                setState(() {
                                                  _currentAmount =
                                                      int.parse(value);
                                                });
                                              },
                                              keyboardType: TextInputType
                                                  .numberWithOptions(),
                                              controller: _amountController,
                                              decoration: InputDecoration(),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: IconButton(
                                              icon: Icon(Icons.add_circle),
                                              onPressed: () {
                                                setState(() {
                                                  _currentAmount++;
                                                  _amountController.text =
                                                      '$_currentAmount';
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Card(
                              child: ListView(
                                children: <Widget>[
                                  Image.network(
                                    products[i]['image']['link'],
                                    height: 130,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          color: Theme.of(context).primaryColor,
                                          padding: EdgeInsets.all(8),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "\$ ${products[i]['price']}0",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      color:
                                                          Colors.grey[300]))),
                                          alignment: Alignment.center,
                                          child: Text(
                                              "${products[i]['stock']} Items"),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                      ),
                    ),
                    Divider(
                      height: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _filterByCategory(categories[index]['id']);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border:
                                    categories[index]['id'] == _currentCategory
                                        ? Border(
                                            top: BorderSide(
                                                color: Colors.green, width: 2))
                                        : null,
                              ),
                              child: Text(
                                '${categories[index]['title'].toString().toUpperCase()}',
                                style: TextStyle(
                                    color: categories[index]['id'] ==
                                            _currentCategory
                                        ? Colors.green
                                        : Colors.black),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )),
          ),

          /* Sidebar Cart */
          Expanded(
            flex: 4,
            child: Container(
              height: _HEIGHT,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 1,
                    color: Colors.grey[300],
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _WIDTH > 800 ?  Expanded(
                          flex: 0,
                          child: Container(
                            padding: EdgeInsets.all(2.0),
                            child: Text("Customer"),
                          ),
                        ):Text(""),
                        Expanded(
                          flex: 1,
                          child: FlatButton(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(Icons.filter_center_focus),
                              Text("SCAN")
                            ],
                          ),
                          onPressed: () => print("object"),
                        ),),

                        Expanded(
                          flex: 1,
                          child:FlatButton(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(Icons.contacts),
                              Text("SEARCH")
                            ],
                          ),
                          onPressed: () => print("object"),
                        ),),
                        Expanded(
                          flex: 1,
                          child:FlatButton(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(Icons.person_add),
                              Text("ADD")
                            ],
                          ),
                          onPressed: () => print("object"),
                        ),),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Expanded(
                    flex: 9,
                    child: ListView.separated(
                      itemCount: carts.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          onTap: () {
                            _removeFromCart(i);
                          },
                          title: RichText(
                            text: TextSpan(
                                text:
                                    '${carts[i]['title'].toString().toUpperCase()}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' x ${carts[i]['amount']}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.orange,
                                      ))
                                ]),
                          ),
                          subtitle: Text('${carts[i]['price']}0'),
                          trailing: Text(
                              '${multi(carts[i]['price'], carts[i]['amount'])}0'),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return Divider(
                          height: 1,
                        );
                      },
                    ),
                  ),
                  Divider(height: 1,),
                  Expanded(
                      flex: 1,
                      child: MaterialButton(
                        padding: EdgeInsets.all(0),
                        splashColor: Colors.blue,
                        onPressed: () {
                          print("charged");
                          Navigator.of(context).pushNamed('/charge');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.lightGreen,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Charge $charge",
                                style: TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 5, left: 5),
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
