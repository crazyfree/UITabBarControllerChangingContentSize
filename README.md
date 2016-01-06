### Introduce
This demonistration to guide you how to change UITabBarController's content view in Xcode 7 and iOS 9. 
I wrote this demo on Xcode 7.2

### How to use
Since xcode 7 prevents you access to UITransitionView in UITabBarController directly. The content view is always fullscreen. 
Well, this is the solution!

In this demo, I've customed UITabBar and place it on top of UITabBarController

All you need is, changing UITransitionView size after UITabBarControlelr finishes layout itself

```
-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [tabBarBtnContainer invalidateIntrinsicContentSize];
    
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.origin.y = self.view.frame.origin.y + 20;
    tabBarBtnContainer.frame = tabFrame;
    
    UIView *transitionView = self.view.subviews[0];
    transitionView.frame = CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height - 70);
}

```
### Trouble?
Create an issue or email to me at: vuongvankhanh89@gmail.com

### License
MIT of course!

