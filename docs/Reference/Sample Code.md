```dart
  
class HolePainter extends CustomPainter {  
 @override  
 void paint(Canvas canvas, Size size) {  
 final paint = Paint();  
 paint.color = Colors.blue;  
 canvas.drawPath(  
 Path.combine(  
 PathOperation.difference,  
 Path()  
 ..addRRect(RRect.fromLTRBR(100, 100, 200, 200, Radius.circular(10))),  
 Path()  
 ..addOval(Rect.fromCircle(center: Offset(100, 100), radius: 50))  
 ..close(),  
 ), paint,  
 ); }  
 @override  
 bool shouldRepaint(CustomPainter oldDelegate) {  
 return false;  
 }}  
  
class EditAvatar extends StatelessWidget {  
 @override  
 Widget build(BuildContext context) {  
 return Scaffold(  
 appBar: AppBar(  
 title: Text('Hole in rounded rectangle'),  
 ), body: CustomPaint(  
 painter: HolePainter(),  
 child: Container(),  
 ), ); }}
```