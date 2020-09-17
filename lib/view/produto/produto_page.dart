import 'package:fl_store/view/layout.dart';
import 'package:flutter/material.dart';

class ProdutoPage extends StatelessWidget {
  static String tag = '/produto-page';

  @override
  Widget build(BuildContext context) {


    
    var content = Container(


      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Stack(
              children: [
                ListView.builder(


                    itemCount: 3,
                    itemBuilder: (BuildContext context, int i){
                      return Container(
color: Colors.red,
                        child: ClipRRect(
                          //borderRadius: Border,
                          
                          
                          child: Image.asset(
                            'assets/images/produtos/prod-${i + 1}.jpg',
                            fit: BoxFit.cover,),
                        ),
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );

    
    return Layout.render(context, content);
  }
}
