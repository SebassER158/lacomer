import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  //Manejar estados de los wishlist de las opciones
  bool fav1 = false;
  bool fav2 = false;
  bool fav3 = false;
  bool fav4 = false;

  //Contador de cantidades
  int cont1 = 0;
  int cont2 = 0;
  int cont3 = 0;
  int cont4 = 0;

  final List<Tab> tabs = <Tab>[
    const Tab(
      child: Text(
        'Todo',
        style: TextStyle(fontFamily: 'Helvetica Neue',),
        overflow: TextOverflow.ellipsis,
      ),
    ),
    const Tab(
      child: Text(
        'Frutas y verduras',
        style: TextStyle(fontFamily: 'Helvetica Neue',),
        overflow: TextOverflow.ellipsis,
      ),
    ),
    const Tab(
      child: Text(
        'Carnes',
        style: TextStyle(fontFamily: 'Helvetica Neue',),
        overflow: TextOverflow.ellipsis,
      ),
    ),
    const Tab(
      child: Text(
        'Abarrotes',
        style: TextStyle(fontFamily: 'Helvetica Neue',),
        overflow: TextOverflow.ellipsis,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: const Color(0xff94be2c)),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Cambiar sucursal",
                              style: TextStyle(color: Color(0xff94be2c), fontFamily: 'Helvetica Neue'),
                            ),
                            Container(
                                padding: const EdgeInsets.all(5),
                                child: Image.asset(
                                  "assets/ic_cambiar_sucursal.png",
                                  scale: 2,
                                ))
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            color: Color(0xff94be2c),
                          ),
                          Text("Sucursal norte", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue'),),
                        ],
                      )
                    ],
                  ),
                  Image.asset("assets/ic_menu.png")
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          color: Colors.orange[50],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.search,
                              color: Color(0xfff85e11),
                            ),
                            hintText: "Buscar productos...",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ),
                  Image.asset("assets/ic_filtro.png")
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                            "Hasta 35% off en frutas y\nverduras seleccionadas", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue')),
                        Text("")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            "Ver oferta",
                            style: TextStyle(color: Color(0xff94be2c), fontFamily: 'Helvetica Neue'),
                          ),
                        ),
                        Image.asset("assets/banner.png")
                      ],
                    ),
                  ],
                ),
              ),
              TabBar(
                controller: _tabController,
                tabs: tabs,
                labelColor: const Color(0xff94be2c),
                indicatorColor: const Color(0xff94be2c),
              ),
              GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: .99,
                  crossAxisSpacing: 23,
                  mainAxisSpacing: 23,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2),
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/isotipo.png")),
                              Container(
                                  alignment: Alignment.topRight,
                                  margin: const EdgeInsets.all(5),
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          fav1 = !fav1;
                                        });
                                      },
                                      child: fav1
                                          ? Image.asset(
                                              "assets/ic_wishlist_activo.png")
                                          : Image.asset(
                                              "assets/ic_wishlist.png")))
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Producto 1",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue'),
                                ),
                                Text(
                                  "\$25.00",
                                  style: TextStyle(color: Color(0xff94be2c), fontFamily: 'Helvetica Neue'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "1 kg",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey
                                        , fontFamily: 'Helvetica Neue'),
                                  ),
                                ),
                                cont1 > 0
                                    ? Expanded(
                                      flex: 2,
                                      child: Container(
                                          margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                    
                                              border: Border.all(
                                                  width: 1,
                                                  color: const Color(0xff94be2c)),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    cont1--;
                                                  });
                                                },
                                                child: const Icon(Icons.remove, color: Color(0xff94be2c)),
                                              ),
                                              Text("$cont1 kg", style: const TextStyle(fontSize: 12, fontFamily: 'Helvetica Neue'),),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    cont1++;
                                                  });
                                                },
                                                child: const Icon(Icons.add, color: Color(0xff94be2c)),
                                              ),
                                            ],
                                          ),
                                        ),
                                    )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            cont1++;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                          color: Color(0xff94be2c),
                                        )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2),
                            blurRadius: 4.0,
                            spreadRadius:
                                1.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/isotipo.png")),
                              Container(
                                  alignment: Alignment.topRight,
                                  margin: const EdgeInsets.all(5),
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          fav2 = !fav2;
                                        });
                                      },
                                      child: fav2
                                          ? Image.asset(
                                              "assets/ic_wishlist_activo.png")
                                          : Image.asset(
                                              "assets/ic_wishlist.png")))
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Producto 2",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue'),
                                ),
                                Text(
                                  "\$30.00",
                                  style: TextStyle(color: Color(0xff94be2c), fontFamily: 'Helvetica Neue'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "1 kg",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey, fontFamily: 'Helvetica Neue'),
                                  ),
                                ),
                                cont2 > 0
                                    ? Expanded(
                                      flex: 2,
                                      child: Container(
                                          margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                    
                                              border: Border.all(
                                                  width: 1,
                                                  color: const Color(0xff94be2c)),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    cont2--;
                                                  });
                                                },
                                                child: const Icon(Icons.remove, color: Color(0xff94be2c)),
                                              ),
                                              Text("$cont2 kg", style: const TextStyle(fontSize: 12, fontFamily: 'Helvetica Neue'),),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    cont2++;
                                                  });
                                                },
                                                child: const Icon(Icons.add, color: Color(0xff94be2c)),
                                              ),
                                            ],
                                          ),
                                        ),
                                    )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            cont2++;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                          color: Color(0xff94be2c),
                                        )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2),
                            blurRadius: 4.0,
                            spreadRadius:
                                1.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/isotipo.png")),
                              Container(
                                  alignment: Alignment.topRight,
                                  margin: const EdgeInsets.all(5),
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          fav3 = !fav3;
                                        });
                                      },
                                      child: fav3
                                          ? Image.asset(
                                              "assets/ic_wishlist_activo.png")
                                          : Image.asset(
                                              "assets/ic_wishlist.png")))
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Producto 3",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue'),
                                ),
                                Text(
                                  "\$25.90",
                                  style: TextStyle(color: Color(0xff94be2c), fontFamily: 'Helvetica Neue'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "1 kg",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey, fontFamily: 'Helvetica Neue'),
                                  ),
                                ),
                                cont3 > 0
                                    ? Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                    
                                              border: Border.all(
                                                  width: 1,
                                                  color: const Color(0xff94be2c)),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    cont3--;
                                                  });
                                                },
                                                child: const Icon(Icons.remove, color: Color(0xff94be2c)),
                                              ),
                                              Text("$cont3 kg", style: const TextStyle(fontSize: 12, fontFamily: 'Helvetica Neue'),),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    cont3++;
                                                  });
                                                },
                                                child: const Icon(Icons.add, color: Color(0xff94be2c)),
                                              ),
                                            ],
                                          ),
                                        ),
                                    )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            cont3++;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                          color: Color(0xff94be2c),
                                        )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2),
                            blurRadius: 4.0,
                            spreadRadius:
                                1.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/isotipo.png")),
                              Container(
                                  alignment: Alignment.topRight,
                                  margin: const EdgeInsets.all(5),
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          fav4 = !fav4;
                                        });
                                      },
                                      child: fav4
                                          ? Image.asset(
                                              "assets/ic_wishlist_activo.png")
                                          : Image.asset(
                                              "assets/ic_wishlist.png")))
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Producto 4",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue'),
                                ),
                                Text(
                                  "\$30.90",
                                  style: TextStyle(color: Color(0xff94be2c), fontFamily: 'Helvetica Neue'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    "1 kg",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey, fontFamily: 'Helvetica Neue'),
                                  ),
                                ),
                                cont4 > 0
                                    ? Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                    
                                              border: Border.all(
                                                  width: 1,
                                                  color: const Color(0xff94be2c)),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    cont4--;
                                                  });
                                                },
                                                child: const Icon(Icons.remove, color: Color(0xff94be2c)),
                                              ),
                                              Text("$cont4 kg", style: const TextStyle(fontSize: 12, fontFamily: 'Helvetica Neue'),),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    cont4++;
                                                  });
                                                },
                                                child: const Icon(Icons.add, color: Color(0xff94be2c)),
                                              ),
                                            ],
                                          ),
                                        ),
                                    )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            cont4++;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                          color: Color(0xff94be2c),
                                        )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xfff85e11)),
              label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.discount, color: Color(0xfff85e11)),
              label: "Descuentos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Color(0xfff85e11)),
              label: "Carrito"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Color(0xfff85e11)),
              label: "Wishlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Color(0xfff85e11)),
              label: "Mi cuenta")
        ],
      ),
    );
  }
}
