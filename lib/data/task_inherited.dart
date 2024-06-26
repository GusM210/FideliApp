import 'package:cartao/components/card.dart';
import 'package:flutter/material.dart';

class CardInherited extends InheritedWidget {
  CardInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<CardFidelity> cardList = [];

  void newCardFidelity(String nome, int idCartao) {
    cardList.add(CardFidelity(nome, idCartao));
    print(cardList);
  }

  void deleteCardFidelity (idCartao) {
    cardList.removeWhere((idCartao) => true);
  }

  static CardInherited of(BuildContext context) {
    final CardInherited? result =
        context.dependOnInheritedWidgetOfExactType<CardInherited>();
    assert(result != null, 'No CardInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CardInherited oldWidget) {
    return oldWidget.cardList.length != cardList.length;
  }
}
