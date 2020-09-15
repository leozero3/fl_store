import 'dart:math';
import 'package:fl_store/view/layout.dart';
import 'package:fl_store/view/produto/categoria_page.dart';
import 'package:flutter/material.dart';

///identificador para girar a roda
enum SwypeDirection { left, right }

class RodaCategoria extends StatefulWidget {
  @override
  _RodaCategoriaState createState() => _RodaCategoriaState();
}

class _RodaCategoriaState extends State<RodaCategoria>
    with SingleTickerProviderStateMixin {
  ///controlador da animação
  AnimationController _controller;

  //para tween 1 = 360º
  //para transform.rotate = pi * 2 = 360º

  ///Atributos para contralar o grau de giro por item
  double _startDeg = 0.0;
  double _endDeg = 0.0;

  ///controle do lado que o usuario esta arrastando a roda
  double _dragInitial = 0;
  SwypeDirection _swypeDirection;

  ///controle do item atual
  int _currentItem = 0;

  @override
  void initState() {
    super.initState();

    /// inicia a animação da roda
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();

    ///mata a animação
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /// SOMBRAS DA RODA ----------------------------------------------------
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 2,
                offset: Offset(2, 0),
                color: Layout.Dark(.4))
          ]),
        ),

        ///ANIMAÇÃO RODA -------------------------------------------------------
        RotationTransition(
          turns: Tween(begin: _startDeg, end: _endDeg).animate(_controller),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CategoriaPage(Layout.categorias[_currentItem]['id'])));
              print(Layout.categorias[_currentItem]);
            },

            /// posição inicial da roda
            onHorizontalDragStart: (details) {
              _dragInitial = details.globalPosition.dx;
            },

            /// verifica o lado que a roda foi arrastada
            onHorizontalDragUpdate: (details) {
              _swypeDirection = SwypeDirection.right;

              if ((details.globalPosition.dx - _dragInitial) < 0) {
                _swypeDirection = SwypeDirection.left;
              }
            },

            /// Aplica animação dependendo do lado que arrastou
            onHorizontalDragEnd: (details) {
              //(_startDeg) Marca apocisao inicial da roda com a ultima posição que a animação fez
              _startDeg = _endDeg;
              _controller.reset(); // reinicia a animação

              /// informa o angulo para girar
              switch (_swypeDirection) {
                case SwypeDirection.left:
                  _endDeg -= (1 / Layout.categorias.length);

                  /// troca o indice do item selecionado (item do topo)
                  _currentItem++;
                  if (_currentItem > Layout.categorias.length - 1) {
                    _currentItem = 0;
                  }
                  break;

                case SwypeDirection.right:
                  _endDeg += (1 / Layout.categorias.length);

                  _currentItem--;

                  if (_currentItem < 0) {
                    _currentItem = Layout.categorias.length - 1;
                  }
                  break;
                default:
              }

              _swypeDirection = null;

              ///dispara a animação
              setState(() {
                _controller.forward();
              });
            },

            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Stack(
                children: _getCategorias(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _getCategorias() {
    List<Widget> result = [];

    result.add(
      /// roda imagem de fundo
      ClipRRect(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
        child: Image.asset(
          'assets/images/bg-catwheel.png',
          fit: BoxFit.cover,
        ),
      ),
    );

    /// icones da roda
    /// define o fator de angulação de cada item
    /// ou seja, o quanto cada um vai ser angulado
    var angleFactor = (pi * 2) / Layout.categorias.length;
    var angle = -angleFactor;

    for (Map<String, dynamic> item in Layout.categorias) {
      /// Aplica fator de angulação
      angle += angleFactor;

      result.add(
        Transform.rotate(
          angle: angle,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Icon(
                    item['icon'],
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                Text(
                  item['text'],
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Layout.Light()),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return result;
  }
}
