import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/bloc/user_bloc.dart';
import 'package:user_app/repositories/user_repository.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Page Example'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is UserLoadedState) {
                  return ListTile(
                    title: Text(state.users["name"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${state.users["id"]}'),
                        Text('Username: ${state.users["username"]}'),
                        Text('Email: ${state.users["email"]}'),
                        Text('Phone: ${state.users["phone"]}'),
                        Text('Website: ${state.users["website"]}'),
                      ],
                    )
                  );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
