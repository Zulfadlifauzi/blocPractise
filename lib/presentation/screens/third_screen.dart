import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/cubitsample_cubit.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key, required this.title, required this.colors})
      : super(key: key);

  final String title;
  final Color colors;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: Text('${widget.title}#5'),
                  onPressed: () {
                    BlocProvider.of<CubitIncrementDecrement>(context)
                        .decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title}#6'),
                  onPressed: () {
                    BlocProvider.of<CubitIncrementDecrement>(context)
                        .increment();
                    // context.bloc<CubitsampleCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add_outlined),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            // MaterialButton(
            //   onPressed: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (newContext) => BlocProvider.value(
            //               value:
            //                   BlocProvider.of<CubitIncrementDecrement>(context),
            //               child: SecondScreen(
            //                 title: 'Second Screen',
            //                 colors: Colors.redAccent,
            //               ),
            //             )));
            //   },
            //   child: Text('Go to Second Screen'),
            //   color: widget.colors,
            // )
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
