//
//  NGHourlyStatus.h
//  FaceCheckin
//
//  Created by Bruno Bulic on 2/28/13.
//  Copyright (c) 2013 Neogov. All rights reserved.
//

#import "NGNibView.h"
#import "NGCoreTimer.h"


@class NGCheckinData;

////////////////////////////////////////////////////////////////////////////////////////////////////

@interface NGHourlyStatus : NGNibView<NGCoreTimerProcotol>

/// Still unused, for future use!
@property (nonatomic, unsafe_unretained) id delegate;

/// Notifices weather the user's checked in (readonly).
@property (nonatomic, readonly) BOOL sessionInProgress;

- (void)clockIn;
- (void)clockOut;

- (NSArray *)checkinData;

@end


@interface NGCheckinFactory : NSObject

@property (nonatomic, readonly) NSDate * startDate;

- (NSDate *)clockIn;
- (NSDate *)clockOut;

@end
