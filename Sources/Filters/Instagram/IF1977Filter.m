//
//  IF1977Filter.m
//  GPUImage-Instagram
//
//  Created by Kim Daewook.
//  Copyright (c) 2015 Kim Daewook. All rights reserved.
//

#import "IF1977Filter.h"

NSString *const kIF1977ShaderString = SHADER_STRING
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

@implementation IF1977Filter


- (id)init
{
    self = [super   initWithFragmentShaderFromString:kIF1977ShaderString
                                             sources:@[
                                                       [IFImageFilter filterImageNamed:@"1977map"],
                                                       [IFImageFilter filterImageNamed:@"1977blowout"]
                                                       ]];
    return self;
}


@end
