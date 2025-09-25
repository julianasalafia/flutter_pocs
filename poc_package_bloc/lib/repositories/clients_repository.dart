import 'package:poc_package_bloc/models/client.dart';

class ClientsRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      Client(nome: 'Amanda Santos'),
      Client(nome: 'Brenda Salafia'),
      Client(nome: 'Juliana Rousseau'),
      Client(nome: 'Julia Gothard'),
    ]);
    return _clients;
  }

  List<Client> addClient(Client client) {
    _clients.add(client);
    return _clients;
  }

  List<Client> removeClient(Client client) {
    _clients.remove(client);
    return _clients;
  }
}
