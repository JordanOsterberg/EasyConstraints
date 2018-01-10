# EasyConstraints (WIP)
An easy way to use NSLayoutConstraints programatically.

### This is a WIP (work in-progress) library. Expect changes, and expect things to break if you update the library.

## Installation
Installation is simple- drag and drop ```UIView+EasyConstraints.swift``` into your project and you can begin using the library.

## Example
If you want an overview of what EasyConstraints does, download the entire project and run it in the simulator.

You will be greeted with a ViewController populated with a UIImage surrounded by some UIViews. Go ahead and drag the slider to change the distance between the objects! You can press the "Enable automatic" button to have the slider and the views do this for you.

![Example One](https://raw.githubusercontent.com/JordanOsterberg/EasyConstraints/Example1.png)

Open ```ExampleViewController.swift``` to view the code powering this example.

Here's how to use EasyConstraints to create a red square in the middle of our screen, with the a width and height of 100:
```swift
let redView : UIView = {
  let view = UIView()
  view.backgroundColor = UIColor.red
  return view
}()

// ...

self.redView.centerVertically(in: self.view)
self.redView.centerHorizontally(in: self.view)
self.redView.setHeight(equalTo: 100)
self.redView.setWidth(equalTo: 100)

```

...and that's it! No need for ```view.translatesAutoresizingMaskIntoConstraints = false``` or any complicated understanding of the auto layout system.

You can use methods like ```layoutBelow(view: self.redView)``` to place views below other views, and much more. View the provided example to see how the library can be utilized.
