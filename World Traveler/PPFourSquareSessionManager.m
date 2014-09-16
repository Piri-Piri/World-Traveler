//
//  PPFourSquareSessionManager.m
//  World Traweler
//
//  Created by David Pirih on 16.09.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import "PPFourSquareSessionManager.h"

static NSString *const PPFourSquareBaseURLString = @"https://api.foursquare.com/v2/";

@implementation PPFourSquareSessionManager

+(instancetype)sharedClient {
    static PPFourSquareSessionManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[PPFourSquareSessionManager alloc] initWithBaseURL:[NSURL URLWithString:PPFourSquareBaseURLString]];
    });
    return _sharedClient;
}

@end
