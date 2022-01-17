
<p align="center">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/water_drop_nav_bar/package_cover.png" alt="Water Drop Nav Bar" />
</p>

<div align="center">

[![Instagram Badge](https://img.shields.io/badge/-Instagram-e84393?style=for-the-badge&labelColor=e84393&logo=instagram&logoColor=white)](https://instagram.com/watery_desert)
[![Twitter Badge](https://img.shields.io/badge/-Twitter-1ca0f1?style=for-the-badge&logo=twitter&logoColor=white&link=https://twitter.com/watery_desert)](https://twitter.com/watery_desert)
[![pub package](https://img.shields.io/pub/v/water_drop_nav_bar.svg?style=for-the-badge)](https://pub.dev/packages/water_drop_nav_bar)
</div>
<hr>

<a href="https://www.buymeacoffee.com/watery_desert"><img src="https://img.buymeacoffee.com/button-api/?text=Support me &emoji=&slug=watery_desert&button_colour=FF5F5F&font_colour=ffffff&font_family=Lato&outline_colour=000000&coffee_colour=FFDD00"></a>


## Design Credit & screen recording
[Animated Tabbar by Cuberto](https://dribbble.com/shots/14723171-Animated-Tabbar)

<img src="https://raw.githubusercontent.com/watery-desert/assets/main/water_drop_nav_bar/demo_recording.gif"  width="300"/>

## How to use?



#### Installation
Add `water_drop_nav_bar:` to your `pubspec.yaml` dependencies then run `flutter pub get`

```yaml
 dependencies:
  water_drop_nav_bar:
```
#### Import
Add this line to import the package.

```dart 
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
```

Add `WaterDropNavBar()` as `bottomNavigationBar` of `Scaffold()` and body would be `PageView()` with `NeverScrollableScrollPhysics()` don't try to upate the seleted index from `onPageChanged` or will see some weird behaviour. Insted of `PageView()` You can use `Stack()` or [AnimatedSwitcher](https://api.flutter.dev/flutter/widgets/AnimatedSwitcher-class.html) for custom page transition animation.

 <details> 
 <summary> API Reference
 </summary>
<br>

barItems → `List<BarItem>`
- List of bar items that shows horizontally, Minimum 2 and maximum 4 items.\
 *required*

onItemSelected → `OnButtonPressCallback`
- Callback When individual barItem is pressed.\
 *required*


selectedIndex → `int`
- Current selected index of the bar item.\
 *required*

backgroundColor → `Color`
- Background Color of the bar.\
*optional [Colors.white]*

waterDropColor → `Color` 
- Color of water drop which is also the active icon color.\
*optional [Color(0xFF5B75F0)]* 

inactiveIconColor → `Color`
- Inactive icon color by default it will use water drop color.\
*optional [waterDropColor]*

iconSize → `double`
- Each active & inactive icon size, default value is 28 don't make it too big or small.\
*optional [28]* 

bottomPadding → `double`
- Bottom padding of the bar. If nothing is provided the it will use
  [MediaQuery.of(context).padding.bottom] value.\
 *optional*  

</details> 
<br>




```dart
 return Scaffold(
     
      body: PageView(
      physics: NeverScrollableScrollPhysics(),       
      controller: pageController,
...
      ),
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: Colors.white,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
          pageController.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.bookmark_rounded,
            outlinedIcon: Icons.bookmark_border_rounded,
          ),
          BarItem(
              filledIcon: Icons.favorite_rounded,
              outlinedIcon: Icons.favorite_border_rounded),
          BarItem(
            filledIcon: Icons.email_rounded,
            outlinedIcon: Icons.email_outlined,
          ),
          BarItem(
            filledIcon: Icons.folder_rounded,
            outlinedIcon: Icons.folder_outlined,
          ),
        ],
      ),
    );
```

### Do and don't
 - Don't make icon size too big.
 - Use complementary filled and outlined icons for best result.
 - `backgroundColor` and `waterDropColor` of `WaterDropNavBar()` and `Scaffold()`'s `backgroundColor` (or whatever widget you are using) must be different (see the example app) This will visualize that the water drop is hanging from the top.
 - ⚠️ For android it's recommended to wrap `Scaffold` with `AnnotatedRegion<SystemUiOverlayStyle>` to change that black navigation bar color to `WaterDropNavBar` `backgroundColor`. Check the example app. Like this 👇

 ```dart
return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        //this color must be equal to the WaterDropNavBar backgroundColor
        systemNavigationBarColor: Colors.white, 
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: // code here
      )
);
```


### FAQ

- #### How do I change the height?

The height must be constant because the animation is in vertical direction. It was like 100 then I reduced it to 60 now. And this removed the issue with the android device, previously looked huge & ugly. Now according to me should not be an issue. But if you still think needs to be reduced then please file an issue with a screenshot. I will see if I can do something.

- #### How do I add drop shadow?

Wrap `SlidingClippedNavBar` with `DecoratedBox` or `Container` and pass `BoxDecoration` to `decoration` property. `BoxDecoration` takes list of `boxShadow` there you can pass your drop shadow.
  ``` dart
  DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 4),
              blurRadius: 8.0)
        ],
      ),
      child: SlidingClippedNavBar()
  )
  ```

  - #### How do I change the corner radius of the navigation bar?
  
Wrap `SlidingClippedNavBar` with ClipRRect and pass `BorderRadius` to `borderRadius` property.
``` dart
  ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(16),
      ),
      child: SlidingClippedNavBar(
    )                
```

<br>
<details>
   <summary>All flutter packages</summary>
   <br>

   ● [Sliding Clipped Nav Bar](https://github.com/watery-desert/sliding_clipped_nav_bar)\
   ➜ [Water Drop Nav Bar](https://github.com/watery-desert/water_drop_nav_bar)\
   ● [Swipeable Tile](https://github.com/watery-desert/swipeable_tile)\
   ● [Loading Animation Widget](https://github.com/watery-desert/loading_animation_widget)
   </summary> 
</details>
<br>
