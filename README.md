# Pre-work - *Name of App Here*

Tippy is a tip calculator application for iOS.

Submitted by: Gangi Palem

Time spent: 4 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Played with colors and layout.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src="http://i.imgur.com/z2bybvV.gif" title="source: imgur.com" />


GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

I am coming Android background and from tip calculator exercise it feels a lot similar - design layout, event
driven programming via event listeners etc. Swift as a language is less verbose than Java. I did a bit of
objective-C a while ago and Swift seems more readable and user-friendly.

Outlets is the mechanism to access UI objects in the code. Actions are kind of event listeners. 

IBOutlets are connected to corresponding UI element. The connection is represented in the following fashion
where destination refers to the ViewController and id refers to the corresponding IBOutlet instance that
references the UI element.
<outlet property="billField" destination="0n4-5z-f8k" id="hV4-fC-Gz0"/>


Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

When there are two objects that holds a strong reference to one other, the reference count is 2 - one from the
reference that was used during object instantiation and other is held by a property in the second object.
So even though the two references are set to nil, still the properties in the instance refer each other. So the
reference count is 1 for both objects and this prevents deallocation. This is how strong reference cycles are
formed.


## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
