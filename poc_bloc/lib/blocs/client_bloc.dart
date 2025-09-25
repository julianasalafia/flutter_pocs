import 'dart:async';

import 'package:poc_bloc/blocs/client_events.dart';
import 'package:poc_bloc/blocs/client_state.dart';
import 'package:poc_bloc/models/client.dart';
import 'package:poc_bloc/repositories/clients_repository.dart';

class ClientBloc {
  final _clientRepository = ClientsRepository();

  final StreamController<ClientEvent> _inputClientController =
      StreamController<ClientEvent>();

  final StreamController<ClientState> _outputClientController =
      StreamController<ClientState>();

  Sink<ClientEvent> get inputClient => _inputClientController.sink;
  Stream<ClientState> get stream => _outputClientController.stream;

  ClientBloc() {
    _inputClientController.stream.listen(_mapEventToState);
  }

  _mapEventToState(ClientEvent event) {
    List<Client> clients = [];

    if (event is LoadClientEvent) {
      clients = _clientRepository.loadClients();
    } else if (event is AddClientEvent) {
      clients = _clientRepository.addClient(event.client);
    } else if (event is RemoveClientEvent) {
      clients = _clientRepository.removeClient(event.client);
    }

    _outputClientController.add(ClientSuccessState(clients: clients));
  }
}
