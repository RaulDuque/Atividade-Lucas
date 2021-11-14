import 'package:atvlucas/models/client_model.dart';
import 'package:flutter/material.dart';

class ListarClientes extends StatefulWidget {
  const ListarClientes(this.clientes, { Key? key }) : super(key: key);

  final List<ClientModel> clientes;

  @override
  _ListarClientesState createState() => _ListarClientesState();
}

class _ListarClientesState extends State<ListarClientes> {
  late List<ClientModel> clientesFiltrados;

  @override
  void initState() {
    super.initState();

    clientesFiltrados = widget.clientes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Listagem dos clientes'),
      ),
      body: Container(
        // Listagem dos clientes
        child: Column(
          children: <Widget>[
            SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Informe o Id do cliente',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                  prefixIcon: Icon(Icons.search),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() {
                  final int? val = int.tryParse(value);

                  if (val != null) {
                    clientesFiltrados = widget.clientes.where((client) => client.id == val).toList();
                  } else {
                    clientesFiltrados = widget.clientes;
                  }
                }),
              ),
            ),
            SizedBox(height: 16),

            if (clientesFiltrados.isEmpty) const Text('Não foi encontrado nenhum cliente'),
            if (clientesFiltrados.isNotEmpty) Expanded(child: ListView.builder(
              itemCount: clientesFiltrados.length,
              itemBuilder: (context, index) {
                final ClientModel cliente = clientesFiltrados[index];

                return Container(
                  color: index % 2 == 0 ? Colors.grey.shade50 : Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: const Text('Id'),
                        subtitle: Text(cliente.id.toString()),
                        visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
                      ),

                      ListTile(
                        title: const Text('Nome'),
                        subtitle: Text(cliente.nome),
                        visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
                      ),

                      ListTile(
                        title: const Text('Email'),
                        subtitle: Text(cliente.email),
                        visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
                      ),

                      if (![null, ''].contains(cliente.cpf)) ListTile(
                        title: const Text('CPF'),
                        subtitle: Text(cliente.cpf!),
                        visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
                      ),

                      if (![null, ''].contains(cliente.telefone)) ListTile(
                        title: const Text('Telefone'),
                        subtitle: Text(cliente.telefone!),
                        visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
                      ),

                      if (![null, ''].contains(cliente.sexo)) ListTile(
                        title: const Text('Sexo'),
                        subtitle: Text(cliente.sexo!),
                        visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
                      ),
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
