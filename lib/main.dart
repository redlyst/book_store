import 'package:flutter/material.dart';

void main() {
  runApp(BookStore());
}

class BookStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> bestSellers = [
    Book(
        "The Study of Brain and Behaivour",
        "Alan W. Watts",
        "assets/The-SBB-Book.png",
        "Dean on Branding presents in a compact form the twenty essential principles of branding that will lead to the creation of strong brands...."),
    Book("96 Types of Light Magic", "Light Yagami", "assets/96-Book.png",
        "Dean on Branding presents in a compact form the twenty essential principles of branding that will lead to the creation of strong brands...."),
    Book("Work For Money Design For Love", "R Kelly", "assets/WFM-Book.png",
        "Dean on Branding presents in a compact form the twenty essential principles of branding that will lead to the creation of strong brands...."),
  ];

  List<Book> popularBooks = [
    Book("Creative Hustle", "Ramen Albert", "assets/Creative-Hustle-Book.png",
        "Dean on Branding presents in a compact form the twenty essential principles of branding that will lead to the creation of strong brands...."),
    Book("Art Unleashed", "Stefano Milik", "assets/Art-Unleashed-Book.png",
        "Dean on Branding presents in a compact form the twenty essential principles of branding that will lead to the creation of strong brands...."),
    Book("The Ninth Life", "Taylor B. Barton", "assets/TNL-Book.png",
        "Dean on Branding presents in a compact form the twenty essential principles of branding that will lead to the creation of strong brands...."),
    Book("Brand Strategy", "Dean Werner", "assets/BS-Book.png",
        "Dean on Branding presents in a compact form the twenty essential principles of branding that will lead to the creation of strong brands....")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Container(
                    width: 24,
                    height: 24,
                    child: Image.asset("assets/icons/home.png"))),
            BottomNavigationBarItem(
                label: 'Bookmark',
                icon: Container(
                    width: 24,
                    height: 24,
                    child: Image.asset("assets/icons/bookmark-a.png"))),
            BottomNavigationBarItem(
                label: 'Shopping',
                icon: Container(
                    width: 24,
                    height: 24,
                    child: Image.asset("assets/icons/shopping-bag.png"))),
            BottomNavigationBarItem(
                label: 'Sliders',
                icon: Container(
                    width: 24,
                    height: 24,
                    child: Image.asset("assets/icons/sliders.png"))),
          ],
          currentIndex: 0,
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 22, right: 22, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageIcon(
                    AssetImage("assets/icons/menu.png"),
                    size: 24,
                  ),
                  ImageIcon(
                    AssetImage("assets/icons/search.png"),
                    size: 18,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, bottom: 17),
              child: Text(
                "Popular Now",
                style: TextStyle(
                    fontFamily: 'Circular',
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 255,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularBooks.length,
                  itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BookDetail(popularBooks[index])));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: (index == 0) ? 25 : 0,
                              right:
                                  (index == popularBooks.length - 1) ? 2 : 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 192,
                                width: 142,
                                child:
                                    Image.asset(popularBooks[index].coverImage),
                              ),
                              SizedBox(height: 17),
                              Text(
                                popularBooks[index].title,
                                style: TextStyle(
                                    fontFamily: 'Circular', fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text(
                                popularBooks[index].author,
                                style: TextStyle(
                                    fontFamily: 'Circular',
                                    fontSize: 12,
                                    color: Color(0xFFC1C0C3)),
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, bottom: 17),
              child: Text(
                "Bestsellers",
                style: TextStyle(
                  fontFamily: 'Circular',
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 275,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bestSellers.length,
                  itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BookDetail(bestSellers[index])));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: (index == 0) ? 25 : 0,
                              right:
                                  (index == bestSellers.length - 1) ? 2 : 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 192,
                                width: 142,
                                child:
                                    Image.asset(bestSellers[index].coverImage),
                              ),
                              SizedBox(height: 17),
                              SizedBox(
                                width: 142,
                                child: Text(
                                  bestSellers[index].title,
                                  style: TextStyle(
                                      fontFamily: 'Circular', fontSize: 16),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                bestSellers[index].author,
                                style: TextStyle(
                                    fontFamily: 'Circular',
                                    fontSize: 12,
                                    color: Color(0xFFC1C0C3)),
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }
}

class BookDetail extends StatefulWidget {
  final Book book;
  BookDetail(this.book);
  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            overflow: Overflow.visible,
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(height: 450, color: Color(0xFFF3E7DD)),
              Container(
                margin: EdgeInsets.only(left: 22, right: 22, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ImageIcon(
                        AssetImage("assets/icons/chevron-left.png"),
                        size: 24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageIcon(
                          AssetImage("assets/icons/bookmark.png"),
                          size: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ImageIcon(
                          AssetImage("assets/icons/menu-a.png"),
                          size: 18,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      height: 245.92,
                      width: 174,
                      child: Image.asset(widget.book.coverImage),
                    ),
                    SizedBox(height: 11),
                    Text(
                      widget.book.title,
                      style: TextStyle(fontFamily: 'Circular', fontSize: 24),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3),
                    Text(
                      widget.book.author,
                      style: TextStyle(
                          fontFamily: 'Circular',
                          fontSize: 18,
                          color: Color(0xFFC1C0C3)),
                    ),
                    SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/icons/star.png"),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/icons/star.png"),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/icons/star.png"),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/icons/star.png"),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/icons/star-half.png"),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(
                              fontFamily: 'Circular', fontSize: 16),
                        ),
                        Text(" / 5.0",
                            style: TextStyle(
                                fontFamily: 'Circular',
                                fontSize: 16,
                                color: Color(0xFFC1C0C3)))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 19,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 24),
                color: Color(0xFFF2F2F2),
                width: 3,
                height: 100,
              ),
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description",
                        style: TextStyle(fontFamily: 'Circular', fontSize: 18)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(widget.book.description,
                        style: TextStyle(
                            fontFamily: 'Circular',
                            fontSize: 16,
                            color: Color(0xFFC1C0C3))),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage("assets/icons/file-text.png"),
                              size: 27,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Preview")
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage("assets/icons/message-square.png"),
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Reviews")
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Row(
              children: [
                Expanded(
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        height: 60,
                        color: Color(0xFF413B89),
                        onPressed: () {},
                        child: Text(
                          "Buy Now For \$29.67",
                          style: TextStyle(
                              fontFamily: 'Circular',
                              fontSize: 18,
                              color: Color(0xFFEECEE7)),
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String coverImage;
  final String description;

  Book(this.title, this.author, this.coverImage, this.description);
}
