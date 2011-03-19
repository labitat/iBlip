//
//  CPTestAppScatterPlotController.h
//  CPTestApp-iPhone
//
//  Created by Brad Larson on 5/11/2009.
//

#import <UIKit/UIKit.h>
//#import "CorePlot-CocoaTouch.h"

@interface CPTestAppScatterPlotController : UIViewController <CPPlotDataSource>
{
	CPXYGraph *graph;
	
	NSMutableArray *dataForPlot;
    // Set up plot ranges here
    // plotSpace.xRange, plotSpace.yRange
    CPXYPlotSpace *plotSpace;
}

@property(readwrite, retain, nonatomic) NSMutableArray *dataForPlot;

@end
