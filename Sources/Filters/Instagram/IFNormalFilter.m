//
//  IFNormalFilter.m
//  GPUImage-Instagram
//
//  Created by Kim Daewook.
//  Copyright (c) 2015 Kim Daewook. All rights reserved.
//

#import "IFNormalFilter.h"

NSString *const kIFNormalShaderString = SHADER_STRING
(
 precision lowp float;
 
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;

 void main()
 {
     
     vec3 texel = texture2D(inputImageTexture, textureCoordinate).rgb;
     
     gl_FragColor = vec4(texel, 1.0);
 }
 );

@implementation IFNormalFilter

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kIFNormalShaderString]))
    {
		return nil;
    }
    
    return self;
}

@end
