import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shoppy_app/utils/api.dart';
import 'package:shoppy_app/utils/colors.dart';
import 'package:shoppy_app/utils/helper.dart';
import 'package:shoppy_app/widgets/heading_text_textbutton_widget.dart';
import 'package:shoppy_app/widgets/textbutton_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final products = Api().getProducts();
  final category = Api().getCategories();
  var productByCategory;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      // extendBody: true,
      // extendBodyBehindAppBar:,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 21.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                child: HeadingText(
                  text: "Categories",
                  bText: "",
                  tap: () {
                    print("view all");
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 27.0),
                child: FutureBuilder(
                  future: category,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    if (snapshot.hasData) {
                      return Container(
                        height: 50.0,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, index) {
                              return TextButtonWidget(
                                text: capExtension(snapshot.data[index])
                                    .capitalizeFirstofEach,
                                size: 25.0,
                                color: primary,
                                tap: () {},
                              );
                            }),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  // scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(left: 32.0, right: 32.0),
                    child: FutureBuilder(
                      future: products,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        }
                        if (snapshot.hasData) {
                          return GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            physics: ClampingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20.0,
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              childAspectRatio: 181 / (227 / 1),
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Stack(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 150.0,
                                      padding: EdgeInsets.only(
                                        top: 5.0,
                                        left: 10.0,
                                        right: 10.0,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: snapshot.data![index].image,
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      margin: EdgeInsets.only(
                                        left: 130.0,
                                        top: 15.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: shadowColor,
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3))
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: Icon(
                                        Icons.favorite_border_outlined,
                                        size: 19,
                                        color: primary,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 160.0,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Text(
                                        convertCurrency(
                                            snapshot.data![index].price),
                                        style: TextStyle(
                                          color: dark,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 180.0,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Text(
                                        snapshot.data![index].title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: dark,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2.0,
        backgroundColor: dark,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: primary,
        selectedFontSize: 16.0,
        iconSize: 35.0,
        unselectedIconTheme: IconThemeData(
          color: white,
          size: 30.0,
        ),
        selectedIconTheme: IconThemeData(size: 35.0),
        unselectedItemColor: white,
        currentIndex: _selectedIndex,
        onTap: _itemTapped,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          // if ( == _selectedIndex)
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Explorer",
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
    );
  }

  int _selectedIndex = 0;
  void _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }
}
