//
//  IFInkwellFilter.m
//  GPUImage-Instagram
//
//  Created by Kim Daewook.
//  Copyright (c) 2015 Kim Daewook. All rights reserved.
//

#import "IFInkwellFilter.h"

NSString *const kIFInkWellShaderString = SHADER_STRING
(
 precision lowp float;
 
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2;
 
 void main()
 {
     vec3 texel = texture2D(inputImageTexture, textureCoordinate).rgb;
     texel = vec3(dot(vec3(0.3, 0.6, 0.1), texel));
     texel = vec3(texture2D(inputImageTexture2, vec2(texel.r, .16666)).r);
     gl_FragColor = vec4(texel, 1.0);
 }
);

@implementation IFInkwellFilter

- (id)init
{
    self = [super   initWithFragmentShaderFromString:kIFInkWellShaderString
                                             sources:@[
                                                       [IFImageFilter filterImageNamed:@"inkwellMap"],
                                                       ]];
    return self;
}


@end
