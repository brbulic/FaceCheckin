//
//  NGDailyReportCellObject.h
//  FaceCheckin
//
//  Created by Bruno Bulic on 2/28/13.
//  Copyright (c) 2013 Neogov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CUCellFramework.h"

@class NGDailyTimeClockData;

@interface NGDailyReportCellObject : NSObject<CUCellItem>

/// Make sure you have a strong reference somwhere!
- (id)initWithDailyReport:(id)dailyReportData;

+ (NSArray *)mockSomeData;

+ (NSArray *)cellObjectsFromReportData:(NSArray *)reportData;

/// Daily report data. id currenlty, but will type-safe it after creating an object
@property (nonatomic, strong, readonly) NGDailyTimeClockData * dailyReportData;

@end
