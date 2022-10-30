import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/cart.dart';
import 'package:shop_app/widgets/product_grid.dart';
import '../configurations.dart';
import '../edit_product_screen.dart';
import '../models/categories_data.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import '../widgets/menu_widget.dart';

class Categories extends StatefulWidget {
  static const routeName = '/categories';
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final ScrollController _scrollController = ScrollController();
  bool isFavorite = false;
  int catIndex = 0;
  bool tap = false;
  int num = 1;
  String category = 'mobile';
  List selectedCategory = categoriesData[0];
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context)
          .fetchAndSetProducts(category, false)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  SliverToBoxAdapter catList(BuildContext context) {
    return SliverToBoxAdapter(
        child: SizedBox(
      height: 110,
      child: Theme(
        data: Theme.of(context).copyWith(
            scrollbarTheme: ScrollbarThemeData(
                thumbColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor))),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          trackVisibility: true,
          thickness: 2,
          child: ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: ((context, index) {
                if (index == 0) {
                  tap = true;
                }
                String key = categories.keys.elementAt(index);
                return catItem(index, key);
              })),
        ),
      ),
    ));
  }

  Column catItem(int index, String key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              category = key.toLowerCase();
              selectedCategory = categoriesData[index];
              catIndex = index;
              (tap && index != catIndex) ? tap = false : tap = true;
              _isLoading = true;
            });
            Provider.of<Products>(context, listen: false)
                .fetchAndSetProducts(category, false)
                .then((value) {
              setState(() {
                _isLoading = false;
              });
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 50,
            width: 50,
            margin: const EdgeInsets.fromLTRB(0, 20, 30, 10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[350]!,
                      blurRadius: 30,
                      offset: const Offset(0, 10))
                ],
                color: ((tap && index == catIndex))
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              categories[key]!,
              color: ((tap && index == catIndex))
                  ? Colors.white
                  : Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            key,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    num += 1;
    // print('num: $num');
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          actions: [
            Consumer<Cart>(
              builder: (_, cart, ch) =>
                  Badge(child: ch!, value: cart.itemCount.toString()),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 25,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
          ],
          backgroundColor: Colors.transparent,
          leading: MenuWidget(),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              catList(context),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
              _isLoading
                  ? SliverToBoxAdapter(
                      child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      )),
                    ))
                  : ProductGrid()
            ],
          ),
        ));
  }
}
