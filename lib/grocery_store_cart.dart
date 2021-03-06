import 'package:flutter/material.dart';
import 'package:sklep/grocery_provider.dart';

class GroceryStoreCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
    Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Text('Koszyk', style: Theme.of(context).textTheme.headline4.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
          Expanded(
            child: ListView.builder(
              itemCount: bloc.cart.length,
              itemBuilder: (context,index ){
                final item = bloc.cart[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                        bloc.cart[index].product.image,
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Text(item.quantity.toString(), style: TextStyle(color: Colors.white),),
                    const SizedBox(width: 10,),
                    Text('x', style: TextStyle(color: Colors.white)),
                    const SizedBox(width: 10,),
                    Text(item.product.name, style: TextStyle(color: Colors.white)),
                    Spacer(),
                    Text('\$${(item.product.price*item.quantity).toStringAsFixed(2)}', style: TextStyle(color: Colors.white),
                    ),
                  IconButton(icon: Icon(Icons.delete, color: Colors.white,), onPressed: (){
                    bloc.deleteProduct(item);
                  })
                  ],
                ),
              );
            },
          )
          ),],
        ),
      ),
    ),
        Row(
          children: [
            Text(
              'Razem',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Text(
              '\$${bloc.totalPriceElements()}',
              style: Theme.of(context).textTheme.headline4.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: RaisedButton(
            color: Color(0xFFF4C459),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child:  Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text("Dalej",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            onPressed: () => null,
          ),
        ),
      ],
    );
  }
}
