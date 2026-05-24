import 'dart:convert';
import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/filter_handler.dart';
import 'package:dat216_projekt/model/imat/credit_card.dart';
import 'package:dat216_projekt/model/imat/customer.dart';
import 'package:dat216_projekt/model/imat/util/functions.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/model/internet_handler.dart';
import 'package:dat216_projekt/routes.dart';
import 'package:dat216_projekt/widgets/checkout/checkout_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImatDataHandler()),
        ChangeNotifierProxyProvider<ImatDataHandler, FilterHandler>(
          create: (context) => FilterHandler(),
          update: (context, dataHandler, previousFilterHandler) {
            final handler = previousFilterHandler ?? FilterHandler();
            handler.updateBounds(dataHandler.products);
            return handler;
          },
        ),
        ChangeNotifierProvider(create: (_) => CheckoutNavigation()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'iMat',
      routerConfig: appRouter,
      theme: ThemeData(
        useMaterial3: true, 
        colorScheme: AppTheme.colorScheme,
        cardTheme: CardThemeData(
          color: AppTheme.colorScheme.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: AppTheme.colorScheme.outline,
              width: 2,
            )
          ),
        )),
    );
  }
}

// This code is not used.
// Included for testing purposes only
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Image? image;

  @override
  void initState() {
    super.initState();
    //loadImage();
  }

  void loadImage() async {
    final img = await InternetHandler.fetchAndCacheImage(114);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _runTests();
            },
            child: const Center(child: Text('Testa')),
          ),
          //image ?? CircularProgressIndicator(),
        ],
      ),
    );
  }

  void _runTests() async {
    //_fetchDetails();
    //var products = await InternetHandler.getProducts();

    //print(products);
    /*
    //var favorites = await InternetHandler.getFavorites();
    //print(favorites);

    var response = await InternetHandler.getProduct(14);
    print(response);

    var json = jsonDecode(response);
    Product product = Product.fromJson(json);
    print('Product ${product.name}');
*/
    var response = await InternetHandler.getCreditCard();
    dbugPrint(response);

    var json = jsonDecode(response);
    CreditCard creditCard = CreditCard.fromJson(json);
    dbugPrint('CreditCard ${creditCard.holdersName}');

    response = await InternetHandler.getCustomer();
    json = jsonDecode(response);
    Customer customer = Customer.fromJson(json);
    dbugPrint('Customer ${customer.firstName} ${customer.lastName}');

    /*
    response = await InternetHandler.getUser();
    print('User ${response}');

    response = await InternetHandler.getOrders();
    //print('Orders ${response}');

    response = await InternetHandler.getShoppingCart();
    print('Orders ${response}');

    var image = await InternetHandler.fetchAndCacheImage(25);
    */
  }
}
