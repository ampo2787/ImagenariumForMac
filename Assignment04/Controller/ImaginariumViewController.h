//
//  ImaginariumViewController.h
//  Assignment04
//
//  Created by JihoonPark on 30/11/2018.
//  Copyright © 2018 JihoonPark. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImaginariumViewController : NSViewController

@property (weak) IBOutlet NSSlider *zoomSlider;
- (IBAction)sliderChange:(NSSlider *)sender;

@property (nonatomic, strong) NSURL *imageURL;
@end

NS_ASSUME_NONNULL_END
