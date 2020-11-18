import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/routes.dart';
import 'package:boilerplate/stores/language/language_store.dart';
import 'package:boilerplate/stores/post/post_store.dart';
import 'package:boilerplate/stores/product/product_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_dialog/material_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:snaplist/snaplist.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// class CaroApp extends StatefulWidget {
//   @override
//   _CaroAppState createState() => _CaroAppState();
// }

// class _CaroAppState extends State<CaroApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Card Carousel App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Center(child: Text("Hello there!")),
//     );
//   }
// }

class _HomeScreenState extends State<HomeScreen> {
  //stores:---------------------------------------------------------------------
  PostStore _postStore;
  ProductStore _productStore;
  ThemeStore _themeStore;
  LanguageStore _languageStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);
    _postStore = Provider.of<PostStore>(context);
    _productStore = Provider.of<ProductStore>(context);

    // check to see if already called api
    if (!_productStore.loading) {
      _productStore.getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: showBody(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white10),
              accountName: Text("John Doe",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.cyan[200],
                      //fontWeight: FontWeight,
                      fontSize: 24)),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.cyan[200],
                child: Text(
                  "J",
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),
            ),
            // DrawerHeader(
            //   child: Text('CATEGORIES',
            //     textAlign: TextAlign.left,
            //     style: TextStyle(
            //       fontWeight: FontWeight.w700,
            //       color: Colors.white,
            //       fontSize: 20,
            //       fontFamily: 'Poppins'
            //       ),
            //     ),
            //   decoration: BoxDecoration(
            //     color: Colors.cyan
            //     ),
            //   ),
            ListTile(
              title: Text('Staples'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Snacks'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Beverages'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Meats'),
              onTap: () {},
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 16),
              title: Text(
                'Logout',
                style: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: Colors.cyan[200]),
              ),
              onTap: () {
                SharedPreferences.getInstance().then((preference) {
                  preference.setBool(Preferences.is_logged_in, false);
                  Navigator.of(context).pushReplacementNamed(Routes.login);
                });
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 16),
              title: Text(
                'Account',
                style: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: Colors.cyan[200]),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget imageCarousel = new Container(
      height: 200.0,
      child: GestureDetector(
        onTap: () {},
        child: new Carousel(
          boxFit: BoxFit.cover,
          borderRadius: true,
          radius: Radius.circular(20),
          images: [
            AssetImage('assets/images/Offer1.jpg'),
            AssetImage('assets/images/Offer2.jpg'),
          ],
          autoplay: true,
          animationCurve: Curves.fastLinearToSlowEaseIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 4.0,
          indicatorBgPadding: 2.0,
        ),
      ));
  // app bar methods:-----------------------------------------------------------
  Widget _buildAppBar() {
    return AppBar(
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white12,
        // leading: GestureDetector(
        // onTap: () { /* Write listener code here */ },
        //child: Icon(
        // Icons.menu,  // add custom icons also
        // ),
        //),
        title: Text(
          'GROCERS',
          style: TextStyle(
            color: Colors.cyan[200],
            //fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Poppins',
            //fontWeight: FontWeight.w700
          ),
        ),
        actions: <Widget>[
          //   Padding(
          //     padding: EdgeInsets.only(right: 20.0),
          //     child: GestureDetector(
          //     onTap: () {
          //       SharedPreferences.getInstance().then((preference) {
          //       preference.setBool(Preferences.is_logged_in, false);
          //       Navigator.of(context).pushReplacementNamed(Routes.login);
          //     }
          //   );
          // },
          //       child: Icon(
          //         Icons.logout,
          //         size: 26.0,
          //       ),
          //     ),
          //   ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.shopping_cart),
              ))
        ]);
  }

  // List<Widget> _buildActions(BuildContext context) {
  //   return <Widget>[
  //    // _buildLogoutButton(),
  //   ];
  // }
  int _index = 0;
  Widget showBody() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: ListView(
        children: <Widget>[
          imageCarousel,
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              "Shop By Category",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 20.0),
          //   height: 200.0,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: <Widget>[
          //       Container(
          //         width: 160.0,
          //         color: Colors.red,
          //       ),
          //       Container(
          //         width: 160.0,
          //         color: Colors.blue,
          //       ),
          //       Container(
          //         width: 160.0,
          //         color: Colors.green,
          //       ),
          //       Container(
          //         width: 160.0,
          //         color: Colors.yellow,
          //       ),
          //       Container(
          //         width: 160.0,
          //         color: Colors.orange,
          //       ),
          //     ],
          //   ),
          // ),
          // Center(
          //   child: SizedBox(
          //     height: 200, // card height
          //     child: PageView.builder(
          //       itemCount: 10,
          //       controller: PageController(viewportFraction: 0.7),
          //       onPageChanged: (int index) => setState(() => _index = index),
          //       itemBuilder: (_, i) {
          //         return Transform.scale(
          //           scale: i == _index ? 1 : 0.95,
          //           child: Card(
          //             elevation: 2,
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(20)),
          //             child: Center(
          //               child: Text(
          //                 "Category ${i + 1}",
          //                 style: TextStyle(fontSize: 32),
          //               ),
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 260,
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/img_login.jpg",
                            height: 150,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                          ListTile(
                            title: Text("Staples"),
                            subtitle: Text("Finest Staples"),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 260,
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/img_login.jpg",
                            height: 150,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                          ListTile(
                            title: Text("Grocery"),
                            subtitle: Text("Groceries at best price"),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 260,
                    child: Card(
                      child: Wrap(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/img_login.jpg",
                            height: 150,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                          ListTile(
                            title: Text(
                              "Fruit",
                              style: TextStyle(fontFamily: 'Poppins'),
                            ),
                            subtitle: Text("Freshh Fruits"),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Text(
              "Top Items",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700),
            ),
          ),
          // Container(
          //   width: 200,
          //   child: Card(
          //     child: Wrap(
          //       children: <Widget>[
          //         Image.asset(
          //           "assets/images/img_login.jpg",
          //           height: 150,
          //           width: 200,
          //           fit: BoxFit.cover,
          //         ),
          //         ListTile(
          //           title: Text(
          //             "Fruit",
          //             style: TextStyle(fontFamily: 'Poppins'),
          //           ),
          //           subtitle: Text("Freshh Fruits"),
          //         ),
          GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 8.0 / 10.0,
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.all(5),
                  child: Card(
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/img_login.jpg'),
                                  fit: BoxFit.fill),
                            ),
                          )),
                          Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Name",
                                style: TextStyle(fontSize: 18.0),
                              )),
                        ],
                      )));
            },
          )
        ],
      ),
    );
  }

  Widget _buildThemeButton() {
    return Observer(
      builder: (context) {
        return IconButton(
          onPressed: () {
            _themeStore.changeBrightnessToDark(!_themeStore.darkMode);
          },
          icon: Icon(
            _themeStore.darkMode ? Icons.brightness_5 : Icons.brightness_3,
          ),
        );
      },
    );
  }

  // Widget _buildLogoutButton() {
  //   return IconButton(
  //     onPressed: () {
  //       SharedPreferences.getInstance().then((preference) {
  //         preference.setBool(Preferences.is_logged_in, false);
  //         Navigator.of(context).pushReplacementNamed(Routes.login);
  //       });
  //     },
  //     icon: Icon(
  //       Icons.power_settings_new,
  //     ),
  //   );
  // }

  // Widget _buildLanguageButton() {
  //   return IconButton(
  //     onPressed: () {
  //       _buildLanguageDialog();
  //     },
  //     icon: Icon(
  //       Icons.language,
  //     ),
  //   );
  // }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(children: <Widget>[
      showBody(),
      //_buildBigOffer(),
      // _buildCategories(),
    ]);

    //_handleErrorMessage(),
  }
  // CarouselSlider(
  //   options: CarouselOptions(
  //     height: 200.0,
  //   autoPlay: true,
  //   autoPlayInterval: Duration(seconds: 3),
  //   autoPlayAnimationDuration: Duration(milliseconds: 800),
  //   autoPlayCurve: Curves.fastOutSlowIn,

  //   aspectRatio: 2.0,
  //   // onPageChanged: (index) {
  //   //   setState(() {
  //   //     _currentIndex = index;
  //   //   }
  // ),

  //pauseAutoPlayOnTouch: Duration(seconds: 10),
  //   items: cardList.map((card){
  //     return Builder(
  //       builder:(BuildContext context){
  //         return Container(
  //           height: MediaQuery.of(context).size.height*0.30,
  //           width: MediaQuery.of(context).size.width,
  //           child: Card(
  //             color: Colors.blueAccent,
  //             child: card,
  //           ),
  //         );
  //       }
  //     );
  //   }).toList(),
  // ),
  // Row(
  //   children: <Widget>[Text('OKKKKKKK')],
  // )
  // ]
  // );
  // }
  // _buildMainContent(),

  // Widget _buildBigOffer() =>Column(
  //   children: <Widget>[
  //   CarouselSlider.builder(
  //     itemCount: 15,
  //     itemBuilder: (BuildContext context, int itemIndex) =>
  //       Container(
  //       child: CarouselSlider(items: null),
  //       ),
  //       options: CarouselOptions(
  //         autoPlay: true,
  //         enlargeCenterPage: true,
  //         aspectRatio: 2.0,
  //         initialPage: 2,
  //         viewportFraction: 0.9,
  //         enableInfiniteScroll: false,
  //       ),
  //     ),
  //     RaisedButton(
  //         onPressed: () => buttonCarouselController.nextPage(
  //             duration: Duration(milliseconds: 300), curve: Curves.linear),
  //         child: Text('→'),
  //       )
  //     ]
  // );

// Widget _buildBigOffer() {
//     Widget imageCarousel = new Container(
//         height: 345.0,
//         child: CarouselSlider(
//           height: 400.0,
//           items: [
//             'http://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg',
//             'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg',
//             'http://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg',
//             'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg'
//           ].map((i) {
//             return Builder(
//               builder: (BuildContext context) {
//                 return Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: EdgeInsets.symmetric(horizontal: 5.0),
//                     decoration: BoxDecoration(color: Colors.amber),
//                     child: GestureDetector(
//                         child: Image.network(i, fit: BoxFit.fill),
//                         onTap: () {
//                           // Navigator.push<Widget>(
//                           //   context,
//                           //   // MaterialPageRoute(
//                           //   //   //builder: (context) => ImageScreen(i),
//                           //   // ),
//                           // );
//                         }));
//               },
//             );

  Widget _buildBigOffer() {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0), top: Radius.circular(20.0)),
          child: Image.asset('assets/images/img_login.jpg'),
        ));
  }

  // Widget _buildCategories() {
  //   return GridView.count(
  //     crossAxisCount: 3,
  //     children: List.generate(2, (index) {
  //       return Center(child: Text('Ohhk'));
  //     }),
  //   );
  // }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return _postStore.loading
            ? CustomProgressIndicatorWidget()
            : Material(child: _buildListView());
      },
    );
  }

  Widget _buildListView() {
    return _productStore.productList != null
        ? ListView.separated(
            itemCount: _productStore.productList.products.length,
            separatorBuilder: (context, position) {
              return Divider();
            },
            itemBuilder: (context, position) {
              return _buildListItem(position);
            },
          )
        : Center(
            child: Text(
              AppLocalizations.of(context).translate('home_tv_no_post_found'),
            ),
          );
    // return _postStore.postList != null
    //     ? ListView.separated(
    //         itemCount: _postStore.postList.posts.length,
    //         separatorBuilder: (context, position) {
    //           return Divider();
    //         },
    //         itemBuilder: (context, position) {
    //           return _buildListItem(position);
    //         },
    //       )
    //     : Center(
    //         child: Text(
    //           AppLocalizations.of(context).translate('home_tv_no_post_found'),
    //         ),
    //       );
  }

  Widget _buildListItem(int position) {
    return ListTile(
      dense: true,
      leading: Icon(Icons.cloud_circle),
      title: Text(
        '${_productStore.productList.products[position].name}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        '${_productStore.productList.products[position].id}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_postStore.errorStore.errorMessage.isNotEmpty) {
          return _showErrorMessage(_postStore.errorStore.errorMessage);
        }

        return SizedBox.shrink();
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message != null && message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: AppLocalizations.of(context).translate('home_tv_error'),
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }

  _buildLanguageDialog() {
    _showDialog<String>(
      context: context,
      child: MaterialDialog(
        borderRadius: 5.0,
        enableFullWidth: true,
        title: Text(
          AppLocalizations.of(context).translate('home_tv_choose_language'),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        headerColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        closeButtonColor: Colors.white,
        enableCloseButton: true,
        enableBackButton: false,
        onCloseButtonClicked: () {
          Navigator.of(context).pop();
        },
        children: _languageStore.supportedLanguages
            .map(
              (object) => ListTile(
                dense: true,
                contentPadding: EdgeInsets.all(0.0),
                title: Text(
                  object.language,
                  style: TextStyle(
                    color: _languageStore.locale == object.locale
                        ? Theme.of(context).primaryColor
                        : _themeStore.darkMode
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // change user language based on selected locale
                  _languageStore.changeLanguage(object.locale);
                },
              ),
            )
            .toList(),
      ),
    );
  }

  _showDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
    });
  }
}
