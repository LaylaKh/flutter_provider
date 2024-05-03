import 'package:flutter/material.dart';
import 'package:flutter_provider/shopping_cart.dart';
import 'package:flutter_provider/theme_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(create: (context) => ShoppingCartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Provider'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;

  @override
  Widget build(BuildContext context) {
    List<int> tovary = [for(int i = 1; i < 50; i++) i];
        return Scaffold(
          backgroundColor: context.watch<ThemeProvider>().getBGColor,
          appBar: AppBar(
            leading:   Text(
              '${context.watch<ShoppingCartProvider>().shoppingCart.length}',
            style: const TextStyle(
              fontSize: 50,
            ),
               ),
            actions: [IconButton(onPressed: (){
              context.read<ThemeProvider>().changeTheme();
            }, icon: const Icon(Icons.sunny),
            ),
            ],
            backgroundColor: context.watch<ThemeProvider>().getAppBarColor,
            title: Text(title),
          ),
          body: Center(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3
              ), 
              itemCount: tovary.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  context
                  .read<ShoppingCartProvider>()
                  .shoppingCart.
                  contains(tovary[index],
                  )
                  ? context.read<ShoppingCartProvider>().removeFromCart(
                    tovary[index],
                  ) 
                  : context.read<ShoppingCartProvider>().addToCart(
                    tovary[index]
                  );
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color:
                    context.watch<ShoppingCartProvider>().shoppingCart.contains(tovary[index]) ? Colors.white :
                   Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Center(
                    child: Text(
                      tovary[index].toString(),
                      style: const TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: Stack(
            children: [
              FloatingActionButton(
                onPressed: (){},
                tooltip: 'Increment',
                child: const Stack(
                  children: [
                    Icon(Icons.shopping_cart
                    ),
                  ],
                ),
              ),
            ],
          ), 
        );
     }
  }

