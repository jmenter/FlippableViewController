/*
    The MIT License (MIT)

    Copyright (c) 2015 Jeff Menter

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
*/

#import "JAMFlippableViewController.h"

@interface JAMFlippableViewController ()
@property (nonatomic) UIViewController *primaryViewController;
@property (nonatomic) UIViewController *secondaryViewController;
@property (nonatomic, weak) UIViewController *currentViewController;
@end

@implementation JAMFlippableViewController

- (instancetype)initWithPrimaryViewController:(UIViewController *)primaryViewController
                      secondaryViewController:(UIViewController *)secondaryViewController;
{
    if (!(self = [super init])) { return nil; }
    
    self.primaryViewController = primaryViewController;
    self.secondaryViewController = secondaryViewController;
    self.flipDuration = 0.5;
    
    return self;
}

- (void)viewDidLoad;
{
    [super viewDidLoad];
    [self addChildViewController:self.primaryViewController];
    [self addChildViewController:self.secondaryViewController];
    
    [self.view addSubview:self.primaryViewController.view];
    [self.primaryViewController didMoveToParentViewController:self];
    self.currentViewController = self.primaryViewController;
}

- (void)flipViewControllers;
{
    if (self.currentViewController == self.primaryViewController) {
        [self flipToSecondaryViewController];
    } else if (self.currentViewController == self.secondaryViewController) {
        [self flipToPrimaryViewController];
    }
}

- (void)flipToSecondaryViewController;
{
    if (self.currentViewController == self.primaryViewController) {
        [self flipFromViewController:self.primaryViewController toViewController:self.secondaryViewController];
    }
}

- (void)flipToPrimaryViewController;
{
    if (self.currentViewController == self.secondaryViewController) {
        [self flipFromViewController:self.secondaryViewController toViewController:self.primaryViewController];
    }
}

- (void)flipFromViewController:(UIViewController *)from toViewController:(UIViewController *)to;
{
    [self transitionFromViewController:from toViewController:to duration:self.flipDuration
                               options:(self.currentViewController == self.primaryViewController) ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight
                            animations:nil completion:^(BOOL finished) {
        if (finished) {
            self.currentViewController = to;
        }
    }];
}


@end
