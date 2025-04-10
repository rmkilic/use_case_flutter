part of '../battery_view.dart';

class _PlatformCard extends StatelessWidget {
  const _PlatformCard({required this.callback, required this.title});
  final VoidCallback callback;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: InkWell(
        onTap: callback,
        child: Center(
          child: Text(title, style: context.textTheme.titleMedium,),
        )),
    );
  }
}