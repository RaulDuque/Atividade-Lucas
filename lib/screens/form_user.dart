import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class FormUser extends StatefulWidget {
  FormUser({Key? key}) : super(key: key);

  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cadastrar Cliente',
          style: TextStyle(
              color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CustomTextField(
                    label: 'Nome',
                    icon: Icons.account_circle,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Campo obrigatório'
                        : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      label: 'E-mail',
                      icon: Icons.mail,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        if (validator.isEmail(text)) {
                          return 'E-mail inválido';
                        }
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    label: 'telefone',
                    icon: Icons.phone,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    label: 'CPF',
                    icon: Icons.assignment_late,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  OptionsButton(),
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 100,
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        }
                      },
                      child: Text(
                        'Salvar',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ))
                ],
              )),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;

  const CustomTextField({
    Key? key,
    required this.label,
    this.icon,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black, fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        prefixIcon: icon == null ? null : Icon(icon),
      ),
    );
  }
}

class OptionsButton extends StatelessWidget {
  const OptionsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'GENERO',
        labelStyle: TextStyle(color: Colors.black, fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      value: 'cliente',
      items: [
        DropdownMenuItem(
          child: Text('Masculino'),
          value: 'cliente',
        ),
        DropdownMenuItem(
          child: Text('Feminino'),
          value: 'clienteF',
        ),
        DropdownMenuItem(
          child: Text('Outro'),
          value: 'clienteO',
        ),
      ],
      onChanged: (value) {},
    );
  }
}
