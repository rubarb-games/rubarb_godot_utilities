# rubarb godot utilities
Various godot utility scripts and functions to make development and life easier in general

## TweenHelper
Tween helper is a tweening system closer to the Unity asset DOTween in its functionality. It's made for easier, more compact tweens, as well as extending some useful features missing in the native tween system in Godot.

### Setup

To use this, add the script as a global for easy access
![Global script setup](https://i.postimg.cc/HjDyD4bm/global-setup.png)

TweenHelper.start_tween(object_to_tween:Node, property:String, end_value:Variant, time:float, animation_curve:Curve = null, animation_mode:TweenHelper.Mode = TweenHelper.Mode.NORMAL)

In it's most basic form it works like this. Animating a colorRect to move in its x axis across the screen.
(animated gif below. Script will not loop)
![Basic usage](https://i.postimg.cc/fbnDcqDk/tween-Helper-basic.gif)

For more useful and organic animations, a curve can be supplied. Note: this can overshoot the target by reaching values higher than 1 in its Y axis
![curve supplied](https://i.postimg.cc/QVGTGkcK/tween-Helper-curve.gif)

Animation modes can trigger some basic various behaviours without supplying a curve (supplying null for curve will create a default, linear curve)
![animation modes](https://i.postimg.cc/7PCt4HSK/tween-Helper-single-Line-01.gif)

the tween returns itself, meaning you can chain other methods for extra options.
set_relative(active:bool) let's you switch between having the goal be relative or absolute in relation to the end-goal of the property
![set relative](https://i.postimg.cc/Bt9K9c2x/tween-Helper-relative.gif)

It's set to absolute by default. Letting you create some pretty cool effects when used with multiple objects
![set absolute](https://i.postimg.cc/bYGVPy13/tween-Helper-loop-Absolute.gif)

The tween comes with the signal tween_finished, letting you trigger animations in sequence in a loop
![await workflow](https://i.postimg.cc/QMGKFqzB/tween-Helper-await.gif)

You can also use set_start_snap(active:bool) to snap to the beginning of a tween if you want to make sure you end up where you started
![set start snap](https://i.postimg.cc/pV9cvWK1/tween-Helper-start-snap.gif)

The another() method lets you chain several tweens together to be played in succession, as an alternative to awaits :)
![another method](https://i.postimg.cc/5jdCdq8z/Tweenhelper-another-Tween.gif)

start_tween_callable(start_value:Variant, end_value:Variant, callable_func:Callable, time:float, animation_curve:Curve)

This method works similarly, but only outputs a value to be sent to a callable you supply
![callable](https://i.postimg.cc/K4SMSrtj/tween-Helper-callable.gif)
