# Pre-work - *Tabber*

**Tabber** is a tip calculator application for iOS.

Submitted by: **Evgeny Vlasov**

Time spent: **5** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- After updating default tip in SettingsVC and returning to the mainVC - SegmentedViewController automatically updated to selected tip and total is recalculated.
- SettingsVC implemented with PickerViewController
- Split total bill value to 2, 3 and 4 guests (as in examples)


## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://media.giphy.com/media/l1J3PwuKJ9n1gXWbC/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** 
Outlets - are UI elements (e.g. buttons, text fields, table views) and sometimes - constraints. Whenever we need to manipulate our UI elements, we use references to them within our view controller.  Declared as @IBOutlet.

Actions - are actions (eg “log in when button pressed” )that a given UI element will trigger, when user interacts with it. Declared as @IBAction. 

Storyboard is nothing but a visual representation of a xml that consist of key values. Every view controller is a “scene” with its own ID. Contents of a scene are “objects”. 

**Question 2**: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** 
Strong reference cycles occurs when properties reference each other. Closures can be assigned as a property of a class. If that closure uses properties of that same class - it will appear in closure body as ’self.classProperty.doSmth’. At this point, a closure will have a reference to the object through that ’self’ - we will have a reference cycle, since closure itself is a reference. 


## License

    Copyright 2017 Evgeny Vlasov

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
