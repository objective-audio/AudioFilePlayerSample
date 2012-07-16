//
//  AudioFilePlayer.h
//  AudioFilePlayerSample
//
//  Created by 八十嶋 祐樹 on 12/07/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioUtilities.h"

@interface AudioFilePlayer : NSObject

@property (nonatomic, assign) BOOL isLoop;
@property (nonatomic, assign, readonly) Float32 length;
@property (nonatomic, assign) Float32 startTime;
@property (nonatomic, assign) AudioUnitParameterValue reverbMix;
@property (nonatomic, assign) AudioUnitParameterValue variSpeed;
@property (nonatomic, assign, readonly) Float32 currentPlayTime;

+ (AudioFilePlayer *)sharedAudioFilePlayer;

- (BOOL)openWithURL:(NSURL *)url;
- (void)close;

- (void)setupRegion;
- (void)play;
- (void)stop;

@end
