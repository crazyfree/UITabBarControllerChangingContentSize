//
//  TabBatButtonView.h
//  LivyTalkPro
//
//  Created by Vuong Van Khanh on 12/29/15.
//  Copyright © 2015 softfront. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TabBarButtonDelegate <NSObject>

-(void) tabBarButtonClicked:(UIButton *)sender;

@end

@interface TabBarButtonView : UIView

@property (weak) id<TabBarButtonDelegate> delegate;

- (IBAction)tabBarbtnClicked:(id)sender;

@end
