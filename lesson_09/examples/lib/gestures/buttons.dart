import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ButtonsList(
                enabled: false,
              ),
              const SizedBox(width: 48),
              _ButtonsList(
                enabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonsList extends StatelessWidget {
  final bool enabled;

  const _ButtonsList({
    Key key,
    @required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VoidCallback action = enabled ? () {} : null;

    return Column(
      children: [
        const SizedBox(height: 24),
        TextButton(
          child: Text("TextButton"),
          onPressed: action,
        ),
        const SizedBox(height: 24),
        OutlinedButton(
          child: Text("OutlinedButton"),
          onPressed: action,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          child: Text("ElevatedButton"),
          onPressed: action,
        ),
        const SizedBox(height: 24),
        IconButton(
          icon: Icon(Icons.favorite),
          tooltip: "Like",
          onPressed: action,
        ),
        const SizedBox(height: 24),
        PopupMenuButton<int>(
          enabled: enabled,
          itemBuilder: (context) {
            return <PopupMenuEntry<int>>[
              PopupMenuItem(
                child: Text("Item 1"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Item 2"),
                value: 2,
              ),
              PopupMenuDivider(),
              CheckedPopupMenuItem(
                checked: false,
                child: Text("Checked Item 3"),
                value: 3,
              ),
              CheckedPopupMenuItem(
                checked: true,
                child: Text("Checked Item 4"),
                value: 4,
              ),
            ];
          },
          onSelected: (value) => print(value),
        ),
        const SizedBox(height: 24),
        CupertinoButton(
          child: Text("CupertinoButton"),
          onPressed: action,
        ),
        const SizedBox(height: 24),
        CupertinoButton.filled(
          child: Text("CupertinoButton.filled"),
          onPressed: action,
        ),
      ],
    );
  }
}
