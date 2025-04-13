part of 'speedometer.dart';

class _CustomCard extends StatelessWidget {
  const _CustomCard({required this.title, required this.value, required this.type});
  final String title;
  final double value;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(title, style: context.textTheme.titleSmall!.copyWith(color: Colors.black54),),
            Center(child: Text(value.toStringAsFixed(1), style: context.textTheme.titleLarge!.copyWith(color: Colors.black),)),
            Center(child: Text(type, style: context.textTheme.titleSmall!.copyWith(color: Colors.black54),)),

          ],
        ),
      ),
    );
  }
}