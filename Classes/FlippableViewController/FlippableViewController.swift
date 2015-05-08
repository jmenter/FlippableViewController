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

import UIKit

@objc

class FlippableViewController: UIViewController {

    let primaryViewController:UIViewController
    let secondaryViewController:UIViewController
    weak var currentViewController:UIViewController?
    var flipDuration:NSTimeInterval = 0.5
    
    init(primaryViewController: UIViewController, secondaryViewController: UIViewController) {
        self.primaryViewController = primaryViewController
        self.secondaryViewController = secondaryViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        self.primaryViewController = UIViewController()
        self.secondaryViewController = UIViewController()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(primaryViewController)
        addChildViewController(secondaryViewController)
        
        view.addSubview(primaryViewController.view)
        primaryViewController.didMoveToParentViewController(self)
        currentViewController = primaryViewController
    }

    func flipViewControllers() {
        if currentViewController == primaryViewController {
            flipToSecondaryViewController()
        } else if currentViewController == secondaryViewController {
            flipToPrimaryViewController()
        }
    }
    
    func flipToSecondaryViewController() {
        if currentViewController == primaryViewController {
            flipFromViewController(primaryViewController, toViewController: secondaryViewController)
        }
    }
    
    func flipToPrimaryViewController() {
        if currentViewController == secondaryViewController {
            flipFromViewController(secondaryViewController, toViewController: primaryViewController)
        }
    }
    
    private func flipFromViewController(fromViewController:UIViewController, toViewController:UIViewController) {
        transitionFromViewController(fromViewController, toViewController: toViewController, duration: flipDuration, options: (currentViewController == primaryViewController) ? .TransitionFlipFromLeft : .TransitionFlipFromRight, animations: nil) { (finished) -> Void in
            if finished {
                self.currentViewController = toViewController
            }
        }
    }
}
