import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/usuraio_providers.dart';

class Proveedores extends StatelessWidget{
  const Proveedores({super.key, required this.noemp});

final int noemp;


  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => UsuarioProvider(noemp))
        ], 
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Perfil',
          theme: ThemeData(
            primarySwatch:  Colors.blueGrey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home:  MyVendors(title: 'Perfil', user: noemp),
        )
        
      
      );
  }


}

class MyVendors extends StatefulWidget {
  const MyVendors({super.key, required this.title, required this.user});

 final String title;
final int user;

  @override
  State<MyVendors> createState() => _MyVendorsState();
}

class _MyVendorsState extends State<MyVendors> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold( 
      
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: GestureDetector(
                        onTap: () {
                          // setState(() {

                          // });
                        },
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.arrow_back,
                              size: 35,
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                      
                              )
                ]),
      ),
      body: ListView(
        children: [Column(
          children: const [          
            ElevatedCardExample()
          ],
        )],
      ) 

    );
    
  }
}

class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({super.key});

final prov = 'Servicios SA.CV';
final idProveedor = 'PG01234';
final rfc = 'AAAE941110ku6';
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Card(
        child: SizedBox(
          width: 95,
          height: 300,
          child:  Center(
            child: Column(
              children:  [
                Text('Proveedor: $prov'),
                 Text('IdProveedor: $idProveedor'),
                  Text('RFC: $rfc')

            ]),
          ) ,
        ),
        ),
      );
    
  }
}