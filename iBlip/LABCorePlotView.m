//
//  LABCorePlotView.m
//  iBlip
//
//  Created by Dennis Kjær Jensen on 3/19/11.
//  Copyright 2011 Xstream Media Solutions. All rights reserved.
//

#import "LABCorePlotView.h"
#import <CorePlot/CorePlot.h>

@implementation LABCorePlotView

@synthesize graph;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        graph=[[CPXYGraph alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [graph renderInContext:context];
    
}

- (void)dealloc
{
    [super dealloc];
}

@end
