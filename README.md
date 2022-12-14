
<p align="center">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/water_drop_nav_bar/package_cover.png" alt="Water Drop Nav Bar" />
</p>

<div align="center">

[![YouTube Badge](https://img.shields.io/badge/-YouTube-EA3223?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/waterydesert)
[![Mastodon Badge](https://img.shields.io/badge/-Mastodon-6169F6?style=for-the-badge&logo=mastodon&logoColor=white)](https://mastodon.social/@watery_desert)
[![Patreon Badge](https://img.shields.io/badge/-Patreon-FF424D?style=for-the-badge&logo=patreon&logoColor=white)](https://www.patreon.com/watery_desert)
[![BMC Badge](https://img.shields.io/badge/-Buy_Me_a_Coffee-FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=535353)](https://www.buymeacoffee.com/watery_desert)
[![pub package](https://img.shields.io/pub/v/water_drop_nav_bar.svg?style=for-the-badge)](https://pub.dev/packages/water_drop_nav_bar)
</div>
<hr>


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
- Additional padding at the bottom of the bar. If nothing is provided the it will use
  [MediaQuery.of(context).padding.bottom] value.\
 *optional*  

</details> 

### Do and don't
 - Don't make icon size too big.
 - Use complementary filled and outlined icons for best result.
 - `backgroundColor` and `waterDropColor` of `WaterDropNavBar()` and `Scaffold()`'s `backgroundColor` (or whatever widget you are using) must be different (see the example app) This will visualize that the water drop is hanging from the top.

#### Short example

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
        ],
      ),
    );
```

 ## Issues ❗️

 #### Android

<img src="https://raw.githubusercontent.com/watery-desert/assets/main/water_drop_nav_bar/android-problem.png"  width="300"/>

<br>

 Some android phones might have black navigation bar, this looks ugly. It's recommended to wrap `Scaffold` with `AnnotatedRegion<SystemUiOverlayStyle>` to change that black navigation bar color to `WaterDropNavBar` `backgroundColor`. Check the example app. Like this 👇

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

result 👇

<img src="https://raw.githubusercontent.com/watery-desert/assets/main/water_drop_nav_bar/android-solution.png"  width="300"/>

<br>

You can additionally provide some `bottomPadding` to add padding at the bottom of the bar, I think 8 is enough.

#### iPhone

<img src="https://raw.githubusercontent.com/watery-desert/assets/main/water_drop_nav_bar/old-iphone-problem.png"  width="300"/>

iPhones without swipe home gesture might have such issue where icons are pushed to the bottom. Provide some `bottomPadding`. I added 8 padding here.

result 👇

<img src="https://raw.githubusercontent.com/watery-desert/assets/main/water_drop_nav_bar/old-iphone-solution.png"  width="300"/>

Now you might ask how do you know which phone is using swipe home gesture? 

Well, you can check bottom padding (using `MediaQuery.of(context).padding.bottom`) and if it's less than 34 or something then provide some bottom padding. Definitely try running different simulators and see. 


## FAQ

- #### How do I change the height?

The height must be constant because the animation is in vertical direction. According to me 60 is perfect. But if you think needs to be reduced then please create an issue with a screenshot. I will see if I can do something.

- #### How do I add drop shadow?

Wrap `WaterDropNavBar` with `DecoratedBox` or `Container` and pass `BoxDecoration` to `decoration` property. `BoxDecoration` takes list of `boxShadow` there you can pass your drop shadow.
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
      child: WaterDropNavBar()
  )
  ```

  - #### How do I change the corner radius of the navigation bar?
  
Wrap `WaterDropNavBar` with ClipRRect and pass `BorderRadius` to `borderRadius` property.
``` dart
  ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(16),
      ),
      child: WaterDropNavBar(
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
