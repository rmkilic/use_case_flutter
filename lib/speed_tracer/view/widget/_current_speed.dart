part of '../speed_tracer_view.dart';

class _CurrentSpeed extends StatelessWidget {
  final LocationViewModel viewModel;

  const _CurrentSpeed({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(()=> Container(
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Colors.white, 
            shape: BoxShape.circle, 
            border: Border.all(
              color:  Colors.red , 
              width: 10, 
            ),
             boxShadow: [
            BoxShadow(
              color:  Colors.black.withValues(alpha:.3) , 
              spreadRadius: 5, 
              blurRadius: 6, 
              offset: Offset(0, 0), 
            ),
          ],
          ),
          child: Center(
            child: Text(
              viewModel.speed.value.toStringAsFixed(0),
              style: context.textTheme.displayLarge!.copyWith(
                color: Colors.black, 
                fontWeight: FontWeight.bold
              ),
            )
          ),
        ),),
        SizedBox(height: 30,),
        Text("ANLIK HIZ", style: context.textTheme.titleMedium!.copyWith(letterSpacing: 2.0, fontWeight: FontWeight.bold),)
      ],
    );
  }
}