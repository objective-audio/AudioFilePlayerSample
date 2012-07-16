//
//  AudioUtilities.h
//  AudioUnitTest
//
//  Created by 八十嶋 祐樹 on 11/07/18.
//  Copyright 2011 Yuki Yasoshima. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>


#define require_noerr(errorCode, exceptionLabel)           \
    do  {                                                  \
            if ( __builtin_expect(0 != (errorCode), 0) )   \
        {                                                  \
            goto exceptionLabel;                           \
        }                                                  \
    } while ( 0 )


void GetEffectFormat(AudioStreamBasicDescription *format);