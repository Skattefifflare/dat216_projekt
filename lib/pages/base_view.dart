import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat/product.dart';
import 'package:dat216_projekt/model/imat/util/functions.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/pages/account_view.dart';
import 'package:dat216_projekt/pages/history_view.dart';
import 'package:dat216_projekt/widgets/cart_view.dart';
import 'package:dat216_projekt/widgets/footer.dart';
import 'package:dat216_projekt/widgets/navigation/header.dart';
import 'package:dat216_projekt/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BaseView({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: navigationShell,
      bottomNavigationBar: Footer(),
    );
  }

  Widget _shoppingCart(ImatDataHandler iMat) {
    return Column(
      children: [
        Text('Kundvagn'),
        SizedBox(height: 600, child: CartView()),
        ElevatedButton(
          onPressed: () {
            iMat.placeOrder();
          },
          child: Text('Köp!'),
        ),
      ],
    );
  }

  Container _leftPanel(ImatDataHandler iMat) {
    return Container(
      width: 300,
      color: const Color.fromARGB(255, 154, 172, 134),
      child: Column(
        children: [
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 132,
            child: ElevatedButton(
              onPressed: () {
                iMat.selectAllProducts();
              },
              child: Text('Visa allt'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 132,
            child: ElevatedButton(
              onPressed: () {
                //print('Favoriter');
                iMat.selectFavorites();
              },
              child: Text('Favoriter'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 132,
            child: ElevatedButton(
              onPressed: () {
                var products = iMat.products;
                iMat.selectSelection([
                  products[4],
                  products[45],
                  products[68],
                  products[102],
                  products[110],
                ]);
              },
              child: Text('Urval'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 132,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.CABBAGE),
                );
              },
              child: Text('Grönsaker'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 132,
            child: ElevatedButton(
              onPressed: () {
                //print('Söktest');
                iMat.selectSelection(iMat.findProducts('mj'));
              },
              child: Text('Söktest'),
            ),
          ),
        ],
      ),
    );
  }

  Row _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(onPressed: () {}, child: Text('iMat')),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                dbugPrint('Historik-knapp');
                _showHistory(context);
              },
              child: Text('Köphistorik'),
            ),
            ElevatedButton(
              onPressed: () {
                _showAccount(context);
              },
              child: Text('Användare'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _centerStage(BuildContext context, List<Product> products) {
    // ListView.builder has the advantage that tiles
    // are built as needed.
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductTile(products[index]);
      },
    );
  }

  void _showAccount(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountView()),
    );
  }

  void _showHistory(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryView()),
    );
  }
}
