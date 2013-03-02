//
//  NGCheckinInterval.m
//  FaceCheckin
//
//  Created by Bruno Bulic on 2/28/13.
//  Copyright (c) 2013 Neogov. All rights reserved.
//

#import "NSDate+NGExtensions.h"

#import "NGCheckinInterval.h"
#import <QuartzCore/QuartzCore.h>


#define CheckpointRectAt(x,y) CGRectMake(x, y, 8.0f, 64.0f)

@interface NGCheckinInterval ()

@property (weak, nonatomic) IBOutlet UILabel *inLabel;
@property (weak, nonatomic) IBOutlet UILabel *outLabel;

@property (weak, nonatomic) IBOutlet UILabel *inTime;
@property (weak, nonatomic) IBOutlet UILabel *outTime;

@property (strong, nonatomic) NSDate * startDate;
@property (strong, nonatomic) NSDate * endDate;

@property (assign, nonatomic) CGFloat controlWidth;

@end

@implementation NGCheckinInterval

- (void)setPositionOnSlider:(CGFloat)xCoord {
    self.frame = CGRectMake(xCoord, 0, self.frame.size.width, self.frame.size.height);
}

- (void)customInit {
    self.inLabel.font   = self.outLabel.font    = [UIFont fontWithName:@"GothamNarrow-Medium" size:15];
    self.inTime.font    = self.outTime.font     = [UIFont fontWithName:@"GothamNarrow-Medium" size:15];
    
    self.outTime.hidden = self.outLabel.hidden  = YES;
    
    self.backgroundColor = [UIColor clearColor];
    self.nibView.backgroundColor = [UIColor clearColor];
    
    self.autoresizesSubviews = YES;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    // default frame goes here
    self.frame = CGRectMake(0, 0, 50.f,64.0f);
}

- (NSString*) _formatDate:(NSDate *)date {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"H:mm"];
    return [formatter stringFromDate:date];
}

- (void)setClockInDate:(NSDate *)date {
    
    self.startDate = date;
    
    CALayer * lyr = [CALayer layer];
    lyr.backgroundColor = [UIColor darkGrayColor].CGColor;
    lyr.frame = CheckpointRectAt(0, 0);
    
    [self.layer addSublayer:lyr];
    
    self.inTime.text = [self _formatDate:self.startDate];
}

- (void)setClockOutDate:(NSDate *)date pixelsPerMinute:(CGFloat)ppm {
    self.endDate = date;
    
    NSInteger minutesSirMinutes = [self.endDate minutesBySubtracting:self.startDate];
    self.frame = CGRectMake(self.frame.origin.x, 0, minutesSirMinutes * ppm, self.frame.size.height);
    
    CALayer * lyr       = [CALayer layer];
    lyr.backgroundColor = [UIColor darkGrayColor].CGColor;
    lyr.frame           = CheckpointRectAt(self.frame.size.width - 8, 0);
    [self.layer addSublayer:lyr];
    
    self.nibView.backgroundColor    = [UIColor lightGrayColor];
    self.backgroundColor            = [UIColor lightGrayColor];
    
    self.outLabel.hidden    = NO;
    self.outTime.hidden     = NO;
    
    self.outTime.text = [self _formatDate:self.endDate];
}

@end