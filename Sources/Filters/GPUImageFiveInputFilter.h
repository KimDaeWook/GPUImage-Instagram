//
//  GPUImageFifthInputFilter.h
//  FilterDemo
//
//  Created by JunfengLi on 15/11/27.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "GPUImageFourInputFilter.h"

extern NSString *const kGPUImageFiveInputTextureVertexShaderString;

@interface GPUImageFiveInputFilter : GPUImageFourInputFilter
{
    GPUImageFramebuffer *fifthInputFramebuffer;
    
    GLint filterFifthTextureCoordinateAttribute;
    GLint filterInputTextureUniform5;
    GPUImageRotationMode inputRotation5;
    GLuint filterSourceTexture5;
    CMTime fifthFrameTime;
    
    BOOL hasSetFourthTexture, hasReceivedFifthFrame, fifthFrameWasVideo;
    BOOL fifthFrameCheckDisabled;
}

- (void)disableFifthFrameCheck;

@end
