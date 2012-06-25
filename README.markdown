# UIView+FlexibleLayout

A simple UIView category to customize layouts for iPhone or iPad in an Interface Builder XIB file

## Overview

UIView+FlexibleLayout lets you use runtime custom attributes in XCode's Interface Builder view to perform conditional layout modifications for iPhone and iPad.  Any property set on the view will be checked for an "iPhone" or "iPad" prefix–if the prefix is present, the corresponding value will be set on the view only if the device matches the prefix.  This technique can be used for any KVO-compliant key on UIView objects.

This functionality allows you to more easily use a single XIB file for both iPad and iPhone views with far greater conditional layout capabilities than the standard autoresizing.  Some of the most useful attributes for conditional layout are frame, hidden, center, bounds and alpha.

For example, the following values could be set on different views on an XIB file:

```iPhoneHidden   YES
iPhoneFrame    {{20, 20}, {280, 200}}
iPadBounds     {{0, 0}, {540, 100}}```

## Additional Attributes

In addition to standard UIView properties, UIView+FlexibleLayout also exposes a CGPoint "offset" property, which can be used to easily offset the position of a view.  It is similar to, but simpler than setting the conditional frame of the view explicitly.

## Programatic Invocation

UIView+FlexibleLayout can also be invoked programatically to clean up code slightly.

```[ someView setIPhoneHidden: YES ]```

## Tips 

* When setting the frame programatically, you will most likely want to set fixed left and top margins, and flexible right and bottom margins for views in interface builder.  Otherwise, when the parent view is resized for iPhone/iPad, the view will be moved from its explicit frame position.

* Many of the more useful property types, including CGRect, CGColor and CGPoint, require XCode 4.3 or later.

## License 

This code is open source and covered by a standard BSD license.