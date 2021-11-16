# Desenvolvimento de Aplicativos para Dispositivos Móveis - Exercício 6

Faça um app que cadastre e exiba as informações de clientes. As informações de um cliente são código, nome, telefone, CPF, e-mail e sexo.
 
Inicialmente, o app deve exibir uma activity com duas opções (podem ser botões) para que se possam abrir novas activitys. Ou seja, a partir da activity inicial será possível acessar duas novas activitys, uma para cadastrar um cliente e outra para exibir as informações de um cliente.

A activity responsável pelo cadastro deve exibir os campos necessários para que o usuário digite as informações e confirme o cadastro. Ao finalizar o cadastro de um cliente o app deve exibir uma mensagem de sucesso e limpar os campos preenchidos pelo usuário para que seja possível realizar um novo cadastro posteriormente. Aconselho criar uma classe “Cliente" com os atributos e métodos necessários. Posteriormente, é só armazenar um objeto “Cliente” em alguma estrutura de dados (ArrayList, Array, etc).

A activity responsável por exibir as informações de um cliente deve apresentar um campo para que o usuário possa digitar o código do cliente desejado. A partir do código digitado o app deve exibir as demais informações desse cliente. Caso o código não exista o app deve mostrar uma mensagem informando o usuário.

---

<img width="29%" align="left" alt="Tela inicial" src="https://user-images.githubusercontent.com/57442687/142070475-1a0dab91-ceb4-4f4e-8015-8ba95a403f13.png">
<img width="29%" align="left" alt="Formulário de criação do cliente" src="https://user-images.githubusercontent.com/57442687/142070546-46fc6811-dd25-41d5-9061-adaaa9ee9ec8.png">
<img width="29%" align="left" alt="Cliente criado" src="https://user-images.githubusercontent.com/57442687/142070582-952f6625-72d0-400b-8507-87c804802721.png">
<img width="29%" align="left" alt="Listagem dos clientes" src="https://user-images.githubusercontent.com/57442687/142070604-05396d72-caf7-4d44-934a-e6bdafc6c4ec.png">
<img width="29%" align="left" alt="Busca do cliente pelo Id" src="https://user-images.githubusercontent.com/57442687/142070614-9b2e2667-bc18-4c88-8aa7-51ed0fb0ae6b.png">

<!--
![Tela inicial](https://user-images.githubusercontent.com/57442687/142070475-1a0dab91-ceb4-4f4e-8015-8ba95a403f13.png)
![Formulário de criação do cliente](https://user-images.githubusercontent.com/57442687/142070546-46fc6811-dd25-41d5-9061-adaaa9ee9ec8.png)
![Cliente criado](https://user-images.githubusercontent.com/57442687/142070582-952f6625-72d0-400b-8507-87c804802721.png)
![Listagem dos clientes](https://user-images.githubusercontent.com/57442687/142070604-05396d72-caf7-4d44-934a-e6bdafc6c4ec.png)
![Busca do cliente pelo Id](https://user-images.githubusercontent.com/57442687/142070614-9b2e2667-bc18-4c88-8aa7-51ed0fb0ae6b.png)
-->
