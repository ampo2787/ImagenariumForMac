//
//  TextViewController.m
//  Assignment04
//
//  Created by JihoonPark on 30/11/2018.
//  Copyright © 2018 JihoonPark. All rights reserved.
//

#import "TextViewController.h"
#import "ImaginariumViewController.h"

@interface TextViewController ()

@property (readonly)ImaginariumViewController * imagenariumViewController;
- (IBAction)flowerBtnTouched:(NSButton *)sender;
- (IBAction)pepperBtnTouched:(NSButton *)sender;
- (IBAction)jellyfishBtnTouched:(NSButton *)sender;
@property (weak) IBOutlet NSButton *flowerBtn;
@property (weak) IBOutlet NSButton *peppersBtn;
@property (weak) IBOutlet NSButton *jellyfishBtn;

-(void)whatIsPhoto:(NSString *)photoName;

@end

#pragma mark - Implementation of Methods
@implementation TextViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.imagenariumViewController.view setHidden:YES];
}

-(void)viewWillAppear{
    [super viewWillAppear];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(feelingNotificationHandler:) name:NOTIFICATION_FLOWER object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(feelingNotificationHandler:) name:NOTIFICATION_PEPPERS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(feelingNotificationHandler:) name:NOTIFICATION_JELLYFISH object:nil];
}

#pragma mark - Button Action

- (IBAction)flowerBtnTouched:(NSButton *)sender {
    [self.imagenariumViewController.view setHidden:NO];
    [self.flowerBtn setEnabled:NO];
    [self.peppersBtn setEnabled:YES];
    [self.jellyfishBtn setEnabled:YES];
    [self whatIsPhoto:@"photo_1"];
}

- (IBAction)pepperBtnTouched:(NSButton *)sender {
    [self.imagenariumViewController.view setHidden:NO];
    [self.flowerBtn setEnabled:YES];
    [self.peppersBtn setEnabled:NO];
    [self.jellyfishBtn setEnabled:YES];
    [self whatIsPhoto:@"photo_2"];

}

- (IBAction)jellyfishBtnTouched:(NSButton *)sender {
    [self.imagenariumViewController.view setHidden:NO];
    [self.flowerBtn setEnabled:YES];
    [self.peppersBtn setEnabled:YES];
    [self.jellyfishBtn setEnabled:NO];
    [self whatIsPhoto:@"photo_3"];

}

#pragma mark - Getter for object/ViewController
-(ImaginariumViewController *) imagenariumViewController{
    return (ImaginariumViewController *)self.parentViewController.childViewControllers.lastObject;
}

#pragma mark - Public method
-(void) enableButtons {
    self.imagenariumViewController.view.hidden = YES;
    self.flowerBtn.enabled = YES;
    self.peppersBtn.enabled = YES;
    self.jellyfishBtn.enabled = YES;
}

-(void)whatIsPhoto:(NSString *)photoName{
    [self.imagenariumViewController setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://sslab.cnu.ac.kr/ios/%@.jpg", photoName]]];
}

#pragma mark - Notification Handler

-(void)feelingNotificationHandler:(NSNotification *)noti{
    NSLog(@"feelingNotificationHandler %@", noti.name);
    [self enableButtons];
    if([noti.name isEqualToString:NOTIFICATION_FLOWER]){
        [self flowerBtnTouched:self.flowerBtn];
    }else if([noti.name isEqualToString:NOTIFICATION_PEPPERS]){
        [self pepperBtnTouched:self.peppersBtn];
    } else if([noti.name isEqualToString:NOTIFICATION_JELLYFISH]){
        [self jellyfishBtnTouched:self.jellyfishBtn];
    }
}

@end
