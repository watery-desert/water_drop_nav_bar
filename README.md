
<p align="center">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/watery_desert_logo.png" height="200" alt="Water Drop Nav Bar" />
</p>

# Water Drop Nav Bar

<img src="https://raw.githubusercontent.com/watery-desert/assets/main/water_drop_nav_bar/demo_recording.gif"  width="500"/>

## Design Credit
[Animated Tabbar by Cuberto](https://dribbble.com/shots/14723171-Animated-Tabbar)

## How to use?

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