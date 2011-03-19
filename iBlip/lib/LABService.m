//
//  LABService.m
//  iBlip
//
//  Created by Kasper Kronborg on 19/03/11.
//  Copyright 2011 Xstream Media Solutions. All rights reserved.
//

#import "LABService.h"


@implementation LABService

-(void)fetchBlip:(void(^)())aBlock {
    _block = [aBlock copy];
    connection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://space.labitat.dk/last"]] delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    _block(dataString);
}

@end
