//
//  LABBlipViewController.h
//  iBlip
//
//  Created by Kasper Kronborg on 19/03/11.
//  Copyright 2011 Xstream Media Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LABService.h"


@interface LABBlipViewController : UIViewController <CPPlotDataSource> {
    
    IBOutlet UILabel *blip;
}

@end
