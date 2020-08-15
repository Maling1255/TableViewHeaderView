//
//  MGTablviewHeaderView.m
//  Tableview
//
//  Created by maling on 2020/6/17.
//  Copyright © 2020 maling . All rights reserved.
//

#import "MGTablviewHeaderView.h"

@implementation MGTablviewHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)tapAction:(id)sender {
    
    if (self.tapBlock) {
        self.tapBlock();
    }
}

@end
