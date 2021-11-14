class ClientModel {
  const ClientModel({
    required this.id,
    required this.nome,
    required this.email,
    this.cpf,
    this.telefone,
    this.sexo,
  });

  final int id;
  final String nome;
  final String email;
  final String? cpf;
  final String? telefone;
  final String? sexo;
}
