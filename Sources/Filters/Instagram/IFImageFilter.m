//
//  InstagramFilter.m
//  GPUImageFilters
//
//  Created by KimDaeWook on 1/12/16.
//  Copyright © 2016 KimDaewook. All rights reserved.
//

#import "IFImageFilter.h"
#import <objc/runtime.h>


@implementation IFImageFilter {
    NSArray<GPUImagePicture*>* _sources;
    NSString* _name;
}

+(NSArray<Class>*)allFilterClasses {
    
    static NSMutableArray<Class>* filters = nil;
    static dispatch_once_t filtersDispatch;
    
    dispatch_once(&filtersDispatch, ^{
       
        Class parentClass = [IFImageFilter class];
        
        int numClasses = objc_getClassList(NULL, 0);
        Class *classes = NULL;
        
        classes = (Class*)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        
        filters = [NSMutableArray array];
        for (NSInteger i = 0; i < numClasses; i++)
        {
            // not allow inherit filters for search performance.
            if(class_getSuperclass(classes[i]) == parentClass) {
                [filters addObject:classes[i]];
            }
        }
        
        free(classes);
        
    });
    
    
    return filters;
}

+(GPUImagePicture*)filterImageNamed:(NSString*)name {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"GPUImage.InstagramFilter" ofType:@"bundle"];
    NSBundle* filterImageBundle = [NSBundle bundleWithPath:bundlePath];
    
    UIImage* image = [UIImage imageWithContentsOfFile:[filterImageBundle pathForResource:name ofType:@"png"]];
    
    return [[GPUImagePicture alloc] initWithImage:image];
}

- (id)initWithFragmentShaderFromString:(NSString *)fragmentShaderString {
    self = [self initWithFragmentShaderFromString:fragmentShaderString sources:nil];
    
    return self;
}

- (id)initWithFragmentShaderFromString:(NSString *)fragmentShaderString sources:(NSArray<GPUImagePicture*>*)sources
{
    if (!(self = [super init]))
    {
        return nil;
    }

    
    _sources = sources;
    
    Class filterClass;
    switch (sources.count) {
        case 1:
            filterClass = [GPUImageTwoInputFilter class];
            break;
        case 2:
            filterClass = [GPUImageThreeInputFilter class];
            break;
        case 3:
            filterClass = [GPUImageFourInputFilter class];
            break;
        case 4:
            filterClass = [GPUImageFiveInputFilter class];
            break;
        case 5:
            filterClass = [GPUImageSixInputFilter class];
            break;
        default:
            filterClass = [GPUImageFilter class];
            break;
    }
    
    GPUImageFilter* filter = [[filterClass alloc] initWithFragmentShaderFromString:fragmentShaderString];
    
    [self addFilter:filter];
    
    int sourceIndex = 1;
    for (GPUImagePicture* source in sources) {
        [source addTarget:filter atTextureLocation:sourceIndex++];
        [source processImage];
    }
    
    
    self.initialFilters = [NSArray arrayWithObjects:filter, nil];
    self.terminalFilter = filter;
    
    return self;
}

- (NSString*)name {
    
    if(!_name) {
        _name = NSStringFromClass([self class]);
    }
    
    return _name;
}


@end
