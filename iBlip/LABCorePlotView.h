//
//  LABCorePlotView.h
//  iBlip
//
//  Created by Dennis Kjær Jensen on 3/19/11.
//  Copyright 2011 Xstream Media Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LABCorePlotView : UIView {
    
    CPXYGraph *graph;
    
}

@property (nonatomic, retain) CPXYGraph *graph;

@end
