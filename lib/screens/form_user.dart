import 'package:atvlucas/models/client_model.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class FormUser extends StatefulWidget {
  FormUser({Key? key, required this.clientes}) : super(key: key);

  final List<ClientModel> clientes;

  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  final formKey = GlobalKey<FormState>();
  final controllerNome = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerTelefone = TextEditingController();
  final controllerCPF = TextEditingController();
  String? sexo;

  @override
  void dispose() {
    controllerNome.dispose();
    controllerEmail.dispose();
    controllerTelefone.dispose();
    controllerCPF.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cadastrar Cliente',
          // style: TextStyle(
          //   color: Colors.black87,
          //   fontSize: 30,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  label: 'Nome',
                  controller: controllerNome,
                  icon: Icons.account_circle,
                  validator: (text) => text == null || text.isEmpty
                      ? 'Campo obrigatório'
                      : null,
                ),
                SizedBox(height: 20),

                CustomTextField(
                  label: 'E-mail',
                  controller: controllerEmail,
                  icon: Icons.mail,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (!validator.isEmail(text)) {
                      return 'E-mail inválido';
                    }
                  },
                ),
                SizedBox(height: 20),

                CustomTextField(
                  label: 'Telefone',
                  controller: controllerTelefone,
                  icon: Icons.phone,
                ),
                SizedBox(height: 20),

                CustomTextField(
                  label: 'CPF',
                  controller: controllerCPF,
                  icon: Icons.assignment_late,
                ),
                SizedBox(height: 20),

                OptionsButton(onChanged: (value) => setState(() => sexo = value)),
                SizedBox(height: 92),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      salvarCliente();
                    }
                  },
                  child: Text(
                    'Salvar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Cria um novo cliente conforme os dados informados no formulário
  void salvarCliente() {
    final String nome = controllerNome.text;
    final String email = controllerEmail.text;
    final String cpf = controllerCPF.text;
    final String telefone = controllerTelefone.text;
    int id;

    if (widget.clientes.isEmpty) {
      id = 1;
    } else {
      // Procura pelo cliente com o maior `id`
      final ClientModel cliente = widget.clientes.reduce((current, next) => current.id < next.id ? next : current);

      id = cliente.id + 1;
    }

    widget.clientes.add(ClientModel(id: id, nome: nome, email: email, cpf: cpf, telefone: telefone, sexo: sexo));

    Navigator.pop(context);
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final TextEditingController controller;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.icon,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black, fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        prefixIcon: icon == null ? null : Icon(icon),
      ),
      textInputAction: TextInputAction.next,
      controller: controller,
      validator: validator,
      // onSaved: onSaved,
    );
  }
}

class OptionsButton extends StatelessWidget {
  const OptionsButton({Key? key, required this.onChanged}) : super(key: key);

  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Sexo',
        labelStyle: TextStyle(color: Colors.black, fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      value: 'Masculino',
      items: [
        DropdownMenuItem(
          child: Text('Masculino'),
          value: 'Masculino',
        ),
        DropdownMenuItem(
          child: Text('Feminino'),
          value: 'Feminino',
        ),
        DropdownMenuItem(
          child: Text('Outro'),
          value: 'Outro',
        ),
      ],
      onChanged: onChanged,
    );
  }
}
