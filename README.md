
<p align="center">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/water_drop_nav_bar/package_cover.png" alt="Water Drop Nav Bar" />
</p>

<div align="center">

<a href="https://instagram.com/watery_desert">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/instagram.png" height="32" alt="instagram: watery_desert"></a>

<a href="https://twitter.com/watery_desert">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/twitter.png" height="32" alt="twitter: watery_desert"></a>

<a href="https://dribbble.com/watery_desert">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/dribbble.png" height="32" alt="dribbble: watery_desert"></a>

<a href="https://www.youtube.com/channel/UCMr8V70B4402CNOJEYQ30Qg">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/youtube.png
" height="32" alt="youtube: watery_desert"></a>


<!-- [![Instagram Badge](https://img.shields.io/badge/-watery_desert-e84393?style=flat-square&labelColor=e84393&logo=instagram&logoColor=white)](https://instagram.com/watery_desert)
[![Twitter Badge](https://img.shields.io/badge/-watery_desert-1ca0f1?style=flat-square&logo=twitter&logoColor=white&link=https://twitter.com/watery_desert)](https://twitter.com/watery_desert) -->
</div>

# Water Drop Nav Bar

<img src="https://raw.githubusercontent.com/watery-desert/assets/main/water_drop_nav_bar/demo_recording.gif"  width="500"/>

## Design Credit
[Animated Tabbar by Cuberto](https://dribbble.com/shots/14723171-Animated-Tabbar)

## How to use?

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

Add `WaterDropNavBar()` as `bottomNavigationBar` of `Scaffold()` and body would be `PageView()` with `NeverScrollableScrollPhysics()` don't try to upate the seleted index from `onPageChanged` or will see some weird behaviour. Insted of `PageView()` You can use `Stack()` or `AnimatedSwitcher()` for custom page transition animation. 

Keep that in mind this navigation bar is taller than normal for small screen it might cover more screen real estate.

### **Do and don't**
 - Don't make icon size too big.
 - Use complementary filled and outlined icons for best result.
 - `backgroundColor` and `waterDropColor` of `WaterDropNavBar()` and `Scaffold()`'s `backgroundColor` (or whatever widget you are using) must be different (see the example app) This will visualize that the water drop is hanging from the top.
 - For android I highly recommend to wrap `Scaffold` with [AnnotatedRegion<SystemUiOverlayStyle>] to get best result, check example app I implemented it.

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
