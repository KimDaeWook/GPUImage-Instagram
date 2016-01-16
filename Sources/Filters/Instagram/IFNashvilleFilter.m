//
//  IFNashvilleFilter.m
//  GPUImage-Instagram
//
//  Created by Kim Daewook.
//  Copyright (c) 2015 Kim Daewook. All rights reserved.
//

#import "IFNashvilleFilter.h"

NSString *const kIFNashvilleShaderString = SHADER_STRING
(
 precision lowp float;
 
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2;
 
 void main()
 {
     vec3 texel = texture2D(inputImageTexture, textureCoordinate).rgb;
     texel = vec3(
                  texture2D(inputImageTexture2, vec2(texel.r, .16666)).r,
                  texture2D(inputImageTexture2, vec2(texel.g, .5)).g,
                  texture2D(inputImageTexture2, vec2(texel.b, .83333)).b);
     gl_FragColor = vec4(texel, 1.0);
 }
);

@implementation IFNashvilleFilter



- (id)init
{
    self = [super   initWithFragmentShaderFromString:kIFNashvilleShaderString
                                             sources:@[
                                                       [IFImageFilter filterImageNamed:@"nashvilleMap"],
                                                       ]];
    return self;
}

@end
