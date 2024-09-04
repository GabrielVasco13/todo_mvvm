import 'package:flutter/material.dart';

class ButtonFloating extends StatelessWidget {
  final Function(String value) onSubmitted;
  const ButtonFloating({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(34, 181, 173, 1),
        shape: ShapeBorder.lerp(
          const CircleBorder(),
          const StadiumBorder(),
          0.5,
        ),
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                height: 100,
                width: double.infinity,
                child: TextField(
                  textInputAction: TextInputAction.go,
                  onSubmitted: (value) {
                    onSubmitted(value);
                    Navigator.of(context).pop();
                  },
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Digite a sua tarefa',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
