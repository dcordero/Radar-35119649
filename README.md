# Wrong text color in AVPlayerViewController tabs after minimizing

Project created to report bug on AVPlayerViewController

• Open radar: http://openradar.appspot.com/35119649

# Description

When using the Dark style in AVPlayerViewController, the tabs take a wrong text color after minimizing the App

![](preview.gif)

# Expected

The text color of the tabs is consistant, not changing when the App is minimized

# Steps

This repo contains a very simple xcode project reproducing the issue. It is a very simple instance of AVPlayerViewController which plays Big Buck Bunny.

1. Swipe down to present the player tabs
2. Press the Home button in Siri Remote to minimize the App
3. Open the App again selecting its icon in the spring board
4. Swipe down to present the player tabs

At this point the tabs text color turned black

# Version and Configuration

- Using Dark style
- tvOS 11.0 (15J380)
