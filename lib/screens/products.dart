import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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

  int _currentCategory = 1;
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

  void _filterByCategory(int id) {
    setState(() {
      _currentCategory = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/singleproduct'),
            icon: Icon(Icons.add_shopping_cart),
          )
        ],
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 11,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading: Icon(Icons.list),
                            title: Text("Items"),
                            onTap: () => print("items"),
                          ),
                          Divider(
                            height: 1,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading: Icon(Icons.line_style),
                            title: Text("Categories"),
                            onTap: () => print("categories"),
                          ),
                          Divider(
                            height: 1,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading: Icon(Icons.turned_in),
                            title: Text("Discounts"),
                            onTap: () => print("discounts"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 11,
                        child: ListView.separated(
                          itemCount: products.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              leading:
                                  Image.network(products[i]['image']['link']),
                              title: Text('${products[i]['title']}'),
                              subtitle:
                                  Text('${products[i]['category']['title']}'),
                              trailing: Text('${products[i]['price']}0'),
                            );
                          },
                          separatorBuilder: (context, i) => Divider(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
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
                      border: categories[index]['id'] == _currentCategory
                          ? Border(
                              top: BorderSide(color: Colors.green, width: 2))
                          : null,
                    ),
                    child: Text(
                      '${categories[index]['title'].toString().toUpperCase()}',
                      style: TextStyle(
                          color: categories[index]['id'] == _currentCategory
                              ? Colors.green
                              : Colors.black),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () => Navigator.of(context).pushNamed('/singleproduct'),
      ),
    );
  }
}
