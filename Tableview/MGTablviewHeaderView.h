//
//  MGTablviewHeaderView.h
//  Tableview
//
//  Created by maling on 2020/6/17.
//  Copyright © 2020 maling . All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGTablviewHeaderView : UIView

@property (nonatomic, copy) void(^tapBlock)(void);

@end

NS_ASSUME_NONNULL_END
