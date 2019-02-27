//
//  TextViewController.h
//  Assignment04
//
//  Created by JihoonPark on 30/11/2018.
//  Copyright © 2018 JihoonPark. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

#define NOTIFICATION_FLOWER @"noti_flower"
#define NOTIFICATION_PEPPERS @"noti_peppers"
#define NOTIFICATION_JELLYFISH @"noti_jellyfish"

@interface TextViewController : NSViewController

-(void)enableButtons;

@end

NS_ASSUME_NONNULL_END
