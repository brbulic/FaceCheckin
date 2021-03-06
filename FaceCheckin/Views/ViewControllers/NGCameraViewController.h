//
//  NGCameraViewController.h
//  FaceCheckin
//
//  Created by Bruno Bulic on 2/25/13.
//  Copyright (c) 2013 Neogov. All rights reserved.
//

#import "NGBaseViewController.h"

#import "NGCameraView.h"
#import "NGCoreTimer.h"

@interface NGCameraViewController : NGBaseViewController<NGCameraViewDelegate, NGCoreTimerProcotol>

@end
