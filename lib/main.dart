import 'package:atvlucas/models/client_model.dart';
import 'package:atvlucas/screens/form_user.dart';
import 'package:flutter/material.dart';

/// Faça um app que cadastre e exiba as informações de clientes. As informações de um cliente são código, nome, telefone, CPF, e-mail e sexo.
///
/// Inicialmente, o app deve exibir uma activity com duas opções (podem ser botões) para que se possam abrir novas activitys.
/// Ou seja, a partir da activity inicial será possível acessar duas novas activitys, uma para cadastrar um cliente e outra para exibir as informações de um cliente.
///
/// A activity responsável pelo cadastro deve exibir os campos necessários para que o usuário digite as informações e confirme o cadastro.
/// Ao finalizar o cadastro de um cliente o app deve exibir uma mensagem de sucesso e limpar os campos preenchidos pelo usuário para que seja
/// possível realizar um novo cadastro posteriormente. Aconselho criar uma classe “Cliente" com os atributos e métodos necessários.
/// Posteriormente, é só armazenar um objeto “Cliente” em alguma estrutura de dados (ArrayList, Array, etc).
///
/// A activity responsável por exibir as informações de um cliente deve apresentar um campo para que o usuário possa digitar o código do cliente desejado.
/// A partir do código digitado o app deve exibir as demais informações desse cliente. Caso o código não exista o app deve mostrar uma mensagem informando o usuário

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ClientModel> clientes = <ClientModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Clientes',
          // style: TextStyle(
          //   color: Colors.black87,
          //   fontSize: 30,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Visualizar Clientes',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {},
            ),

            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Criar Cliente',
                style: TextStyle(fontSize: 20),
              ),
              // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FormUser(clientes: clientes))),
              onPressed: () {
                print(clientes);

                Navigator.push(context, MaterialPageRoute(builder: (context) => FormUser(clientes: clientes)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
