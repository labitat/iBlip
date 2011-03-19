//
//  LABService.h
//  iBlip
//
//  Created by Kasper Kronborg on 19/03/11.
//  Copyright 2011 Xstream Media Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *LABITAT_URL;

@interface LABService : NSObject {
    @private
    NSMutableArray *stack;
    
    // Saved for later reference
    //void (^_block)();
}

-(void)fetchBlip:(void(^)())aBlock;
-(void)fetchLast:(void(^)())aBlock;
-(void)fecthLast:(void(^)())aBlock withMilliseconds:(int)milliseconds;
-(void)fecthSince:(void(^)())aBlock withMilliseconds:(int)milliseconds;

@end
