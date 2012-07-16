//
//  PlayerViewController.m
//  AudioFilePlayerSample
//
//  Created by 八十嶋 祐樹 on 12/07/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PlayerViewController.h"
#import "AudioFilePlayer.h"

@interface PlayerViewController ()
@property (nonatomic, retain) NSTimer *timer;
@end

@implementation PlayerViewController
@synthesize timer = _timer;
@synthesize audioFilePath = _audioFilePath;
@synthesize startTimeSlider = _startTimeSlider;
@synthesize loopSwitch = _loopSwitch;
@synthesize variSpeedSlider = _variSpeedSlider;
@synthesize reverbMixSlider = _reverbMixSlider;
@synthesize timeLabel = _timeLabel;

- (void)updateTime:(NSTimer *)timer
{
    Float32 time = [AudioFilePlayer sharedAudioFilePlayer].currentPlayTime;
    self.timeLabel.text = [NSString stringWithFormat:@"%.2fs", time];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.audioFilePath.lastPathComponent;
    NSURL *fileURL = [NSURL fileURLWithPath:self.audioFilePath];
    [[AudioFilePlayer sharedAudioFilePlayer] openWithURL:fileURL];
    self.loopSwitch.on = [AudioFilePlayer sharedAudioFilePlayer].isLoop;
    self.variSpeedSlider.value = [AudioFilePlayer sharedAudioFilePlayer].variSpeed;
    self.reverbMixSlider.value = [AudioFilePlayer sharedAudioFilePlayer].reverbMix;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[AudioFilePlayer sharedAudioFilePlayer] close];
    [self.timer invalidate];
    self.timer = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)play:(UIButton *)sender
{
    [[AudioFilePlayer sharedAudioFilePlayer] play];
}

- (IBAction)stop:(UIButton *)sender
{
    [[AudioFilePlayer sharedAudioFilePlayer] stop];
}

- (IBAction)loop:(UISwitch *)sender
{
    [AudioFilePlayer sharedAudioFilePlayer].isLoop = sender.on;
}

- (IBAction)startTime:(UISlider *)sender
{
    Float32 length = [AudioFilePlayer sharedAudioFilePlayer].length;
    [AudioFilePlayer sharedAudioFilePlayer].startTime = sender.value * length;
}

- (IBAction)reverbMix:(UISlider *)sender
{
    [AudioFilePlayer sharedAudioFilePlayer].reverbMix = sender.value;
}

- (IBAction)variSpeed:(UISlider *)sender
{
    [AudioFilePlayer sharedAudioFilePlayer].variSpeed = sender.value;
}

@end
