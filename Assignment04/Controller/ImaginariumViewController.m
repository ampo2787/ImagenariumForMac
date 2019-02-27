//
//  ImaginariumViewController.m
//  Assignment04
//
//  Created by JihoonPark on 30/11/2018.
//  Copyright © 2018 JihoonPark. All rights reserved.
//

#import "ImaginariumViewController.h"

@interface ImaginariumViewController ()
@property (nonatomic, strong)NSImageView * imageView;
@property (nonatomic, strong)NSImage *image;
@property (weak) IBOutlet NSProgressIndicator *spinner;
@property (weak) IBOutlet NSScrollView *scrollView;
@property double originAnimatorValue;

@end

@implementation ImaginariumViewController

#pragma mark - private method
- (void)startDownloadingImage{
    self.image = nil;
    if(self.imageURL){
        [self.spinner startAnimation:0];
        NSURLRequest *request = [NSURLRequest requestWithURL:self.imageURL];
        NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error){
            
            NSData *data = [NSData dataWithContentsOfURL:location];
            NSImage *image = [[NSImage alloc]initWithData:data];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = image;
            });
        }];
        [task resume];
    }
}

- (NSImageView *)imageView{
    if(!_imageView)
        _imageView = [[NSImageView alloc]init];
    return _imageView;
}

-(NSImage *)image{
    return self.imageView.image;
}

- (void)setImage:(NSImage *)image{
    self.imageView.image = image;
    [self.imageView setFrameSize:CGSizeMake(self.image.size.width, self.image.size.height)];
    [self.spinner stopAnimation:0];
}

-(void)setImageURL:(NSURL *)imageURL{
    _imageURL = imageURL;
    [self startDownloadingImage];
}


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scrollView setFrameSize:self.view.frame.size];
    [self.scrollView setDocumentView:self.imageView];
    self.originAnimatorValue = self.scrollView.magnification;
}

- (IBAction)sliderChange:(NSSlider *)sender {
    self.scrollView.animator.magnification = self.originAnimatorValue * sender.doubleValue / 25;
}
@end
