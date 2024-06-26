import 'package:cartao/data/task_inherited.dart';
import 'package:flutter/material.dart';

class CardFidelity extends StatefulWidget {
  final String nome;
  final int idCartao;

  const CardFidelity(this.nome, this.idCartao, {super.key});

  @override
  State<CardFidelity> createState() => _CardFidelityState();
}

class _CardFidelityState extends State<CardFidelity> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 2),
              color: Colors.blue,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 2),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.nome,
                        textScaleFactor: 0.8,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 60,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: ElevatedButton(
                            onPressed: () {
                              CardInherited.of(context).deleteCardFidelity(
                                  widget.idCartao);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Deletando Cartão')));

                              setState(() {});
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.delete),
                              ],
                            )),
                      )
                    ],
                  )),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        widget.idCartao.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
