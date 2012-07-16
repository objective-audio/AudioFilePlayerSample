//
//  AudioUtilities.c
//  AudioUnitTest
//
//  Created by 八十嶋 祐樹 on 11/07/18.
//  Copyright 2011 Yuki Yasoshima. All rights reserved.
//

#import "AudioUtilities.h"

void GetEffectFormat(AudioStreamBasicDescription *format)
{
    format->mSampleRate = 44100;
    format->mFormatID = kAudioFormatLinearPCM;
    format->mFormatFlags = kAudioFormatFlagsNativeFloatPacked | kAudioFormatFlagIsNonInterleaved;
    format->mBitsPerChannel = 32;
    format->mChannelsPerFrame = 2;
    format->mFramesPerPacket = 1;
    format->mBytesPerFrame = format->mBitsPerChannel / 8;
    format->mBytesPerPacket = format->mBytesPerFrame;
}




