//
//  IFToasterFilter.m
//  GPUImage-Instagram
//
//  Created by Kim Daewook.
//  Copyright (c) 2015 Kim Daewook. All rights reserved.
//

#import "IFToasterFilter.h"

NSString *const kIFToasterShaderString = SHADER_STRING
(
 precision lowp float;
 
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2; //toasterMetal
 uniform sampler2D inputImageTexture3; //toasterSoftlight
 uniform sampler2D inputImageTexture4; //toasterCurves
 uniform sampler2D inputImageTexture5; //toasterOverlayMapWarm
 uniform sampler2D inputImageTexture6; //toasterColorshift
 
 void main()
 {
     lowp vec3 texel;
     mediump vec2 lookup;
     vec2 blue;
     vec2 green;
     vec2 red;
     lowp vec4 tmpvar_1;
     tmpvar_1 = texture2D (inputImageTexture, textureCoordinate);
     texel = tmpvar_1.xyz;
     lowp vec4 tmpvar_2;
     tmpvar_2 = texture2D (inputImageTexture2, textureCoordinate);
     lowp vec2 tmpvar_3;
     tmpvar_3.x = tmpvar_2.x;
     tmpvar_3.y = tmpvar_1.x;
     texel.x = texture2D (inputImageTexture3, tmpvar_3).x;
     lowp vec2 tmpvar_4;
     tmpvar_4.x = tmpvar_2.y;
     tmpvar_4.y = tmpvar_1.y;
     texel.y = texture2D (inputImageTexture3, tmpvar_4).y;
     lowp vec2 tmpvar_5;
     tmpvar_5.x = tmpvar_2.z;
     tmpvar_5.y = tmpvar_1.z;
     texel.z = texture2D (inputImageTexture3, tmpvar_5).z;
     red.x = texel.x;
     red.y = 0.16666;
     green.x = texel.y;
     green.y = 0.5;
     blue.x = texel.z;
     blue.y = 0.833333;
     texel.x = texture2D (inputImageTexture4, red).x;
     texel.y = texture2D (inputImageTexture4, green).y;
     texel.z = texture2D (inputImageTexture4, blue).z;
     mediump vec2 tmpvar_6;
     tmpvar_6 = ((2.0 * textureCoordinate) - 1.0);
     mediump vec2 tmpvar_7;
     tmpvar_7.x = dot (tmpvar_6, tmpvar_6);
     tmpvar_7.y = texel.x;
     lookup = tmpvar_7;
     texel.x = texture2D (inputImageTexture5, tmpvar_7).x;
     lookup.y = texel.y;
     texel.y = texture2D (inputImageTexture5, lookup).y;
     lookup.y = texel.z;
     texel.z = texture2D (inputImageTexture5, lookup).z;
     red.x = texel.x;
     green.x = texel.y;
     blue.x = texel.z;
     texel.x = texture2D (inputImageTexture6, red).x;
     texel.y = texture2D (inputImageTexture6, green).y;
     texel.z = texture2D (inputImageTexture6, blue).z;
     lowp vec4 tmpvar_8;
     tmpvar_8.w = 1.0;
     tmpvar_8.xyz = texel;
     gl_FragColor = tmpvar_8;
 }
);

@implementation IFToasterFilter


- (id)init
{
    self = [super   initWithFragmentShaderFromString:kIFToasterShaderString
                                             sources:@[
                                                       [IFImageFilter filterImageNamed:@"toasterMetal"],
                                                       [IFImageFilter filterImageNamed:@"toasterSoftLight"],
                                                       [IFImageFilter filterImageNamed:@"toasterCurves"],
                                                       [IFImageFilter filterImageNamed:@"toasterOverlayMapWarm"],
                                                       [IFImageFilter filterImageNamed:@"toasterColorShift"],
                                                       ]];
    return self;
}
@end
