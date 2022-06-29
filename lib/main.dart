import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokhan_bozorgan/Data/repository.dart';
import 'bloc/my_bloc_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => MyBlocBloc(repository: Repository()),
    child: MaterialApp(
      home: const HomePage(),
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: BlocBuilder<MyBlocBloc, MyBlocState>(
              builder: (context, state) {
                if (state.stateStatus == Status.initial) {
                  return Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: Text(
                          'Tap the button',
                          style: TextStyle(color: Colors.purple, fontSize: 30),
                        ),
                      )
                    ],
                  );
                } else if (state.stateStatus == Status.loading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: Text(
                          state.sokhan,
                          style: TextStyle(color: Colors.amber, fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "' ${state.author} '",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  );
                }
              },
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            constraints: BoxConstraints(
                maxHeight: 400, minWidth: 300, maxWidth: 300, minHeight: 200),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<MyBlocBloc>().add(LoadNewSokhanEvent());
              },
              child: Text('Give me a Qout')),
        ],
      )),
    );
  }
}
