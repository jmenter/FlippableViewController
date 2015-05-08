
#import "ViewController.h"
#import "JAMFlippableViewController.h"
#import "FlippableViewController-Swift.h"

@implementation NSString (Utilities)

- (BOOL)contains:(NSString *)string;
{
    return [self rangeOfString:string].location != NSNotFound;
}

@end

@implementation UIViewController (Utilities)

+ (instancetype)viewControllerWithBackgroundColor:(UIColor *)backgroundColor andLabelText:(NSString *)labelText;
{
    UIViewController *viewController = UIViewController.new;
    UILabel *label = [UILabel.alloc initWithFrame:viewController.view.frame];
    label.text = labelText;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:17];
    label.backgroundColor = backgroundColor;
    label.numberOfLines = 0;
    viewController.view = label;
    
    return viewController;
}

- (void)dismissAnimated;
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

@implementation ViewController

- (IBAction)launchWasTapped:(UIButton *)sender;
{
    Class viewControllerClass = [sender.titleLabel.text contains:@"Swift"] ? [FlippableViewController class] : [JAMFlippableViewController class];
    NSString *primaryLabel = [@"Primary:\n\n" stringByAppendingString:NSStringFromClass(viewControllerClass)];
    NSString *secondaryLabel = [@"Secondary:\n\n" stringByAppendingString:NSStringFromClass(viewControllerClass)];
    UIViewController *primary = [UIViewController viewControllerWithBackgroundColor:UIColor.redColor
                                                                       andLabelText:primaryLabel];
    UIViewController *secondary = [UIViewController viewControllerWithBackgroundColor:UIColor.greenColor
                                                                         andLabelText:secondaryLabel];
    
    UIViewController *flippableViewController = [viewControllerClass.alloc initWithPrimaryViewController:primary secondaryViewController:secondary];
    
    UINavigationController *navigationController = [UINavigationController.alloc initWithRootViewController:flippableViewController];
    flippableViewController.navigationItem.rightBarButtonItem = [UIBarButtonItem.alloc initWithTitle:@"Flip" style:UIBarButtonItemStylePlain target:flippableViewController action:@selector(flipViewControllers)];
    flippableViewController.navigationItem.leftBarButtonItem = [UIBarButtonItem.alloc initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:flippableViewController action:@selector(dismissAnimated)];
    
    [self presentViewController:navigationController animated:YES completion:nil];

}

@end
