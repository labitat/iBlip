//
//  LABService.h
//  iBlip
//
//  Created by Kasper Kronborg on 19/03/11.
//  Copyright 2011 Xstream Media Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LABService : NSObject {
    @private
    NSURLConnection *connection;
    NSString *dataString;
    
    void (^_block)();
}

-(void)fetchBlip:(void(^)())aBlock;

@end
