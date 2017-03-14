# ColorMonkey

## Visualise the relationship between RGB and HSL colour values.

The application provides 2 groups of controls:
 - RGB Picker and Slider
 - HSL Picker and Slider

Changing the value of any control causes the values of the other controls to change to
their corresponding values.

At the bottom of the main screen there are 2 buttons:
 - Current Colour - displays the currently selected colour.
 - Complement Colour - displays the complement of the currently selected colour.

The complement colour is calculated by moving through `180º` on the HSL colour-wheel.

Tapping the Current Colour button moves to the Colour Palette screen. This has a
table containing variations of the current colour for each of the colour's hue,
saturation, and brightness values.

### Source Code

The application has a number of extensions intended to make working with colours
simpler.