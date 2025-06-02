import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_forms/presentation/providers/providers.dart';

class CubitCounterScreen extends StatelessWidget {
  static const name = 'cubit-counter-screen';

  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    final cubitCounter = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
            onPressed: () => {cubitCounter.reset()},
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => {cubitCounter.increaseBy(3)},
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => {cubitCounter.increaseBy(2)},
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => {cubitCounter.increaseBy(1)},
          ),
        ],
      ),
    );
  }
}
