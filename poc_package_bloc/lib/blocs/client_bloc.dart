import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_package_bloc/blocs/client_events.dart';
import 'package:poc_package_bloc/blocs/client_state.dart';
import 'package:poc_package_bloc/repositories/clients_repository.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final _repository = ClientsRepository();

  ClientBloc() : super(ClientInitialState()) {
    on<LoadClientEvent>(_onLoadClients);
    on<AddClientEvent>(_onAddClient);
    on<RemoveClientEvent>(_onRemoveClient);
  }

  FutureOr<void> _onRemoveClient(event, emit) =>
      emit(ClientSuccessState(clients: _repository.removeClient(event.client)));

  FutureOr<void> _onAddClient(event, emit) =>
      emit(ClientSuccessState(clients: _repository.addClient(event.client)));

  FutureOr<void> _onLoadClients(event, emit) =>
      emit(ClientSuccessState(clients: _repository.loadClients()));
}
