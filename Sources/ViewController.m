//
//  ViewController.m
//  GPUImage-Instagram
//
//  Created by KimDaeWook on 1/16/16.
//  Copyright © 2016 KimDaewook. All rights reserved.
//

#import "ViewController.h"
#import "IFImageFilter.h"
#import "GPUImage.h"

@implementation ViewController{
    NSArray<Class>* instagramFilters;
    NSInteger _filterIndex;
    GPUImagePicture *stillImageSource;
    
}

- (GPUImageView*)imageView {
    return (GPUImageView*)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIImage *inputImage = [UIImage imageNamed:@"sample_kuru.jpg"];
    
    _filterIndex = 0;
    instagramFilters = [IFImageFilter allFilterClasses];
    
    
    stillImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];
    
    [self changeFilter];
    
    
    NSLog(@"Complte");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeFilter {
    
    NSInteger filterIndex = (_filterIndex++ % instagramFilters.count);
    
    [stillImageSource removeAllTargets];
    
    IFImageFilter *imageFilter = [[[instagramFilters objectAtIndex:filterIndex] alloc] init];
    [imageFilter addTarget:(GPUImageView*)self.view];
    
    [stillImageSource addTarget:imageFilter];
    
    [imageFilter useNextFrameForImageCapture];
    [stillImageSource processImage];
    
    
    [imageFilter imageFromCurrentFramebuffer];
    [self.filterLabel setText:[NSString stringWithFormat:@"%@ (%ld/%ld)", imageFilter.name, filterIndex+1, instagramFilters.count]];
    
    
}
@end
