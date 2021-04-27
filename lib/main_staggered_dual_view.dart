import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sklep/grocery_product.dart';

class MainStaggeredDualView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
              "Warzywa i Owoce",
              style: TextStyle(
            color:  Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: StaggeredDualView(
            aspectRatio: 0.65,
              spacing: 30,
              itemBuilder: (context, index) {
            return Product(
              product : groceryProducts[index],
            );
          },
              itemCount: groceryProducts.length
          ),
        )));
  }
}
class Product  extends StatelessWidget {

  const Product({Key key, this.product}) :super(key: key);
  final GroceryProduct product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: <Widget>[
           Expanded(
             child:ClipOval(
         child: AspectRatio(
         aspectRatio: 1,
             child: Image.network(product.image,
               fit: BoxFit.cover,
             ),
         ),
             ),
           ),
           const SizedBox ( height: 10,),
           Expanded(
             child: Column(
               children: <Widget>[
                 Text(
                   product.name,
                   maxLines: 2,
                     style:  TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 13,
                      ),
                 ),
                 Text(
                   product.weight ,
                   maxLines: 2,
                   style:  TextStyle(
                     fontWeight: FontWeight.w300,
                     fontSize: 11,
                     color: Colors.grey
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:List.generate(5,
                           (index) => Icon(
                             index <4 ? Icons.star: Icons.star_border,
                     color: Colors.yellow,
                   )) ,
                 )
               ],
             ),
           )
         ],
       ),
    );
  }
}

class StaggeredDualView extends StatelessWidget {
  const StaggeredDualView({Key key,
    @required this.itemBuilder,
    @required this.itemCount,
    this.spacing =  0.0,
    this.aspectRatio = 0.5,
    this.offsetPercent = 0.5,
  }) :  super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;
  final double offsetPercent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
      final width = constraints.maxWidth;
      final itemHeight = (width * 0.5) / aspectRatio;
      final height = constraints.maxHeight + itemHeight;
      return OverflowBox(
      maxWidth: width,
        minWidth: width,
        maxHeight: height,
        minHeight: height,
        child: GridView.builder(
          padding: EdgeInsets.only( top: itemHeight / 2, bottom: itemHeight),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:  aspectRatio,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Transform.translate(
            offset: Offset(0.0, index.isOdd ? itemHeight * offsetPercent : 0.0),
            child: itemBuilder(context, index),
          );
        },
      ));
    });
  }
}
