
<p align="center">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/watery_desert_logo.png" height="200" alt="Water Drop Nav Bar" />
</p>

# Water Drop Nav Bar

<img src="https://raw.githubusercontent.com/watery-desert/assets/main/water_drop_nav_bar/demo_recording.gif"  width="500"/>

## Design Credit
[Animated Tabbar by Cuberto](https://dribbble.com/shots/14723171-Animated-Tabbar)

## How to use?

 <details> 
 <summary> Api Reference
 </summary>
barItems → `List<BarItem>`
- List of bar items shown horizontally, must not be more than 4 and less than 2.\
 *required*

onButtonPressed → `OnButtonPressCallback`
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
- Each active & inactive icon size, default value is 30 don't make it too big or small.\
*optional [30]* 

</details> 
<br></br>

Add `WaterDropNavBar()` as `bottomNavigationBar` of `Scaffold()` and body would be `PageView()` with `NeverScrollableScrollPhysics()` don't try to upate the seleted index from `onPageChanged` or will see some weird behaviour. Insted of `PageView()` You can use `Stack()` or `AnimatedSwitcher()` for custom page transition animation. 

Keep that in mind this navigation bar is taller than normal for small screen it might cover more screen real estate.

### **Do and don't**
 - Don't make icon size too big.
 - Use complementary filled and outlined icons for best result.
 - `backgroundColor` and `waterDropColor` of `WaterDropNavBar()` and `Scaffold()` body (or whatever widget you are using) must be different so anyone can tell (see the example app). This will visualize that the water drop is hanging from the top.

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
        onButtonPressed: (index) {
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

Feel free to report issue. Please consider giving me star and check my other repositories. This will motivate me to keep working.

## Follow me on social media

[![alt text][1.1]][1]
[![alt text][2.1]][2]

[1.1]: https://github.com/watery-desert/assets/blob/main/social_logo/twitter.png?raw=true

[2.1]: https://github.com/watery-desert/assets/blob/main/social_logo/instagram.png?raw=true

[1]: https://twitter.com/watery_desert
[2]: https://www.instagram.com/watery_desert/