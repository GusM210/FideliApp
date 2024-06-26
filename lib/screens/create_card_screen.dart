import 'package:flutter/material.dart';
import 'package:cartao/screens/home_screen.dart';
import 'package:cartao/data/task_inherited.dart';

class CreateCardScreen extends StatefulWidget {
  const CreateCardScreen({super.key, required this.cardContext});
  final BuildContext cardContext;

  @override
  State<CreateCardScreen> createState() => _CreateCardScreenState();
}

class _CreateCardScreenState extends State<CreateCardScreen> {
  TextEditingController storeNameController = TextEditingController();
  TextEditingController idStoreController = TextEditingController();
  final _formKeyCard = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CardInherited(
      child: Form(
        key: _formKeyCard,
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                height: 500,
                width: 375,
                decoration: const BoxDecoration(
                  color: Colors.white10,

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: const EdgeInsets.all(8.0),
                        child: ClipRRect (
                          child: Image.asset('assets/images/logo.png'),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'Coloque o nome da loja';
                          }
                          return null;
                        },
                        controller: storeNameController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nome da loja',
                          fillColor: Colors.white12,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'Coloque o código da loja';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: idStoreController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Código da loja',
                          fillColor: Colors.white12,
                          filled: true,
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKeyCard.currentState!.validate()) {

                          CardInherited.of(widget.cardContext).newCardFidelity(
                              storeNameController.text,
                              int.parse(idStoreController.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Criando Cartão')));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                              builder: (contextNew) => const HomeScreen(),
                        ));
                        }
                      },
                      child: const Text('Cadastrar cartão!'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
