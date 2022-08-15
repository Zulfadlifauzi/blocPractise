import 'package:appbloc/constants/enums.dart';
import 'package:appbloc/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/cubitsample_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.colors})
      : super(key: key);

  final String title;
  final Color colors;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Wifi) {
                return Text(
                  'Wi-fi',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.green),
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Mobile) {
                return Text(
                  'Mobile',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.blue),
                );
              } else if (state is InternetDisconnected) {
                return Text(
                  'Disconnected',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.red),
                );
              }
              return CircularProgressIndicator();
            }),
            const Text(
              'You have pushed the button this many times:',
            ),
            const Text(
              'This is where the counter value should be displayed',
            ),
            BlocBuilder<CubitIncrementDecrement, CubitState>(
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR,NEGATIVE' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAYYY' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMMMM' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            // Text(
            //   '$_counter',
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     FloatingActionButton(
            //       heroTag: Text('${widget.title}#1'),
            //       onPressed: () {
            //         BlocProvider.of<CubitIncrementDecrement>(context)
            //             .decrement();
            //       },
            //       tooltip: 'Decrement',
            //       child: Icon(Icons.remove),
            //     ),
            //     FloatingActionButton(
            //       heroTag: Text('${widget.title}#2'),
            //       onPressed: () {
            //         BlocProvider.of<CubitIncrementDecrement>(context)
            //             .increment();
            //         // context.bloc<CubitsampleCubit>().increment();
            //       },
            //       tooltip: 'Increment',
            //       child: Icon(Icons.add_outlined),
            //     )
            //   ],
            // ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: Text('Go to Second Screen'),
              color: widget.colors,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: Text('Go to Third Screen'),
              color: widget.colors,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
