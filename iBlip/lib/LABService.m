//
//  LABService.m
//  iBlip
//
//  Created by Kasper Kronborg on 19/03/11.
//  Copyright 2011 Xstream Media Solutions. All rights reserved.
//

#import "LABService.h"


@implementation LABService

+(void)initialize {
    LABITAT_URL = @"http://space.labitat.dk";
}

-(id)init {
    self = [super init];
    if (self) {
        stack = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)dealloc {
    [stack release];
    [super dealloc];
}

#pragma mark Instance methods implementation

-(void)fetchBlip:(void(^)())aBlock {
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/blip", LABITAT_URL]]] delegate:self];
    NSDictionary *tempDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:conn, @"connection", [[aBlock copy] autorelease], @"callback", nil];
    [stack addObject:tempDic];
}

-(void)fetchLast:(void(^)())aBlock {
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/last", LABITAT_URL]]] delegate:self];
    NSDictionary *tempDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:conn, @"connection", [[aBlock copy] autorelease], @"callback", nil];
    [stack addObject:tempDic];
}

-(void)fecthLast:(void(^)())aBlock withMilliseconds:(int)milliseconds {
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/last/%i", LABITAT_URL, milliseconds]]] delegate:self];
    NSDictionary *tempDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:conn, @"connection", [[aBlock copy] autorelease], @"callback", nil];
    [stack addObject:tempDic];
}

-(void)fecthSince:(void(^)())aBlock withMilliseconds:(int)milliseconds {
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/since/%i", LABITAT_URL, milliseconds]]] delegate:self];
    NSDictionary *tempDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:conn, @"connection", [[aBlock copy] autorelease], @"callback", nil];
    [stack addObject:tempDic];
}

#pragma mark NSURLConnection delegate implementation

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSMutableString *dataString = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    for (NSMutableDictionary *dic in stack) {
        NSURLConnection *conn = [dic objectForKey:@"connection"];
        if ([connection isEqual:conn]) {
            NSMutableString *tempDataString = [NSMutableString string];
            if ([dic objectForKey:@"data"]) {
                tempDataString = [dic objectForKey:@"data"];
                [tempDataString appendString:dataString];
            } else {
                tempDataString = dataString;
            }
            [dic setObject:tempDataString forKey:@"data"];
        }
    }
    [dataString release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    for (NSDictionary *dic in stack) {
        NSURLConnection *conn = [dic objectForKey:@"connection"];
        if ([connection isEqual:conn]) {
            void (^block)() = [dic objectForKey:@"callback"];
            block([dic objectForKey:@"data"]);
        }
    }
}

@end
