FlippableViewController
==========================

A simple way to flip between two view controllers.

![FlippableViewController Example](https://raw.githubusercontent.com/jmenter/FlippableViewController/master/example.png)

To use, simply alloc and init with primary and secondary view controllers. You can programmatically flip to either view controller or simply tell the view controller to flip and it will do so.

For example:
<pre><code>
JAMFlippableViewController *vc = [JAMFlippableViewController.alloc initWithPrimaryViewController:myPrimaryViewController
                                                                      andSecondaryViewController:mySecondaryViewController];
</code></pre>
...and then call the methods...
<pre><code>
[vc flipViewControllers];
[vc flipToPrimaryViewController];
[vc flipToSecondaryViewController];
</code></pre>

You can set the duration of the flip transition with the flipDuration property. Easy peasy lemon squeezy.
