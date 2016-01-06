//
//  TabBatButtonView.m
//  LivyTalkPro
//
//  Created by Vuong Van Khanh on 12/29/15.
//  Copyright © 2015 softfront. All rights reserved.
//

#import "TabBarButtonView.h"

@implementation TabBarButtonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)tabBarbtnClicked:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarButtonClicked:)]) {
        [self.delegate tabBarButtonClicked:sender];
    }
}
@end
