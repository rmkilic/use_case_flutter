part of '../speed_tracer_view.dart';


class _PowerButton extends StatelessWidget {
  final LocationViewModel viewModel;
  const _PowerButton({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
                if (viewModel.isTracking.value) {
                  viewModel.stopTracking();
                } else {
                  await viewModel.startTracking();
                }
              },
      child: Obx(()=> Container(
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: Colors.white, 
          shape: BoxShape.circle, 
          border: Border.all(
            color: viewModel.isTracking.value ? Colors.red : Colors.green, 
            width: 3, 
          ),
           boxShadow: [
          BoxShadow(
            color: viewModel.isTracking.value ? Colors.red.withValues(alpha:.3) : Colors.green.withValues(alpha:.3) , 
            spreadRadius: 5, 
            blurRadius: 6, 
            offset: Offset(0, 0), 
          ),
        ],
        ),
        child: Center(
          child: Text(
            viewModel.isTracking.value ? 'STOP' : 'START',
            style: context.textTheme.titleLarge!.copyWith(
              color: viewModel.isTracking.value ? Colors.red : Colors.green, 
              fontWeight: FontWeight.bold
            ),
          )
        ),
      ),)
    );
  }
}