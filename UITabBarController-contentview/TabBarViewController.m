//
//  TabBarViewController.m
//  UITabBarController-contentview
//
//  Created by Vuong Van Khanh on 1/6/16.
//  Copyright © 2016 vizion. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()
{
    TabBarButtonView *tabBarBtnContainer;
}

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tabBar setHidden:YES];
    
    tabBarBtnContainer = [[[NSBundle mainBundle] loadNibNamed:@"FakeTabBarView" owner:self options:nil] firstObject];
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.origin.y = self.view.frame.origin.y + 20;
    tabBarBtnContainer.delegate = self;
    [tabBarBtnContainer setFrame:tabFrame];
    [self.view addSubview:tabBarBtnContainer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [tabBarBtnContainer invalidateIntrinsicContentSize];
    
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.origin.y = self.view.frame.origin.y + 20;
    tabBarBtnContainer.frame = tabFrame;
    
    UIView *transitionView = self.view.subviews[0];
    transitionView.frame = CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height - 70);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - TabBarButtonsDelegate

-(void) tabBarButtonClicked:(UIButton *)sender {
    int controllerIndex = sender.tag;
    
    if ([self.viewControllers indexOfObject:self.selectedViewController] == controllerIndex) {
        NSLog(@"It already shows up");
        return;
    }
    
    if (controllerIndex >= [self.viewControllers count]) {
        NSLog(@"View controller index out of bounds");
        return;
    }
    
    UIViewController *toViewController = [self.viewControllers objectAtIndex:controllerIndex];
    UIView *fromView = self.selectedViewController.view;
    
    UIView *toView = [toViewController view];
    
    // Get the size of the view area.
    CGRect viewSize = fromView.frame;
    BOOL scrollRight = controllerIndex > self.selectedIndex;
    // Add the to view to the tab bar view.
    [fromView.superview addSubview:toView];
    
    // Position it off screen.
    toView.frame = CGRectMake((scrollRight ? viewSize.size.width : -viewSize.size.width), viewSize.origin.y, viewSize.size.width, viewSize.size.height);
    
    [UIView animateWithDuration:0.3
                     animations: ^{
                         tabBarBtnContainer.userInteractionEnabled = NO;
                         // Animate the views on and off the screen. This will appear to slide.
                         toView.frame =CGRectMake(0, 0, viewSize.size.width, viewSize.size.height);
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             // Remove the old view from the tabbar view.
                             [fromView removeFromSuperview];
                             self.selectedIndex = controllerIndex;
                             tabBarBtnContainer.userInteractionEnabled = YES;
                             //                             if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) {
                             //                                 [self.delegate tabBarController:self didSelectViewController:toViewController];
                             //                             }
                         }
                     }];
}

@end
