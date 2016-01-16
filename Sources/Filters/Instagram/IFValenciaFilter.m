//
//  IFValenciaFilter.m
//  GPUImage-Instagram
//
//  Created by Kim Daewook.
//  Copyright (c) 2015 Kim Daewook. All rights reserved.
//

#import "IFValenciaFilter.h"


NSString *const kIFValenciaShaderString = SHADER_STRING
(
 precision lowp float;
 
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2; //map
 uniform sampler2D inputImageTexture3; //gradMap
 
 mat3 saturateMatrix = mat3(
                            1.1402,
                            -0.0598,
                            -0.061,
                            -0.1174,
                            1.0826,
                            -0.1186,
                            -0.0228,
                            -0.0228,
                            1.1772);
 
 vec3 lumaCoeffs = vec3(.3, .59, .11);
 
 void main()
 {
     vec3 texel = texture2D(inputImageTexture, textureCoordinate).rgb;
     
     texel = vec3(
                  texture2D(inputImageTexture2, vec2(texel.r, .1666666)).r,
                  texture2D(inputImageTexture2, vec2(texel.g, .5)).g,
                  texture2D(inputImageTexture2, vec2(texel.b, .8333333)).b
                  );
     
     texel = saturateMatrix * texel;
     float luma = dot(lumaCoeffs, texel);
     texel = vec3(
                  texture2D(inputImageTexture3, vec2(luma, texel.r)).r,
                  texture2D(inputImageTexture3, vec2(luma, texel.g)).g,
                  texture2D(inputImageTexture3, vec2(luma, texel.b)).b);
     
     gl_FragColor = vec4(texel, 1.0);
 }
);

@implementation IFValenciaFilter

- (id)init
{
    self = [super   initWithFragmentShaderFromString:kIFValenciaShaderString
                                             sources:@[
                                                       [IFImageFilter filterImageNamed:@"valenciaMap"],
                                                       [IFImageFilter filterImageNamed:@"valenciaGradientMap"],
                                                       ]];
    return self;
}


@end
