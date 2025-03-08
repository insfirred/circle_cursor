# CircleCursor 🎯

A Flutter package that replaces the default mouse cursor with a smooth and customizable circular pointer. It enhances UI interactions with an inner and outer pointer effect.

##### Built with ❤️ for Flutter Web by Kalash Saini.

  

## Features 🚀
- 🌟 Customizable inner and outer pointers
- 🎨 Set colors, sizes, and border width
- ⏳ Adjustable animation delay for smooth transitions
- ⚡ Lightweight and easy to integrate
- 🔬 Works with any Flutter widget
  

## Getting Started 📌

  

To start using **CircleCursor**, add it to your `pubspec.yaml`:

  

```yaml
dependencies:
circle_cursor:  latest_version
```

Then run,
```bash
flutter pub get
```

  
  
## Sample Code 👨‍💻
```dart
import  'package:flutter/material.dart';
import  'package:circle_cursor/circle_cursor.dart';

void  main() {
runApp(const  MyApp());
}

class  MyApp  extends  StatelessWidget {
	const  MyApp({super.key});

	@override
	Widget  build(BuildContext context) {
		return  CircleCursor(
			innerPointerColor:  Colors.red,
			innerPointerRadius:  10,
			outerPointerColor:  Colors.red.withOpacity(0.5),
			outerPointerRadius:  40,
			outerPointerWidth:  2,
			outerPointerDelay:  Duration(milliseconds:  150),
			child:  MaterialApp(
				home:  Scaffold(
				backgroundColor:  Colors.white,
					body:  Center(
						child:  Text(
							"Hover to see the effect!",
							style:  TextStyle(fontSize:  20),
							),
					),
				),
			),
		);
	}
}
```