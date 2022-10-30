import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/configurations.dart';
import 'package:shop_app/widgets/components/wishListBuilder.dart';
import '../providers/products.dart';
import '../widgets/components/appBars.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  var _isInit = true;
  var _isLoading = false;
  List<String> catList = categories.keys.map((e) => e).toList();

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts("", true).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).favorites;

    return Scaffold(
        body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        favAppBar(context),
        SliverToBoxAdapter(child: WishListBuilder()),
        if (_isLoading)
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Center(
                child: LinearProgressIndicator(
              backgroundColor: Colors.teal.withOpacity(0.4),
              color: Theme.of(context).primaryColor,
            )),
          )),
        if (products.length == 0)
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 2 -
                    MediaQuery.of(context).size.height * 0.2),
            child: Center(
              child: Text("No Favorites Yet!",
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ))
      ],
    ));
  }
}
