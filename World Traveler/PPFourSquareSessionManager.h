//
//  PPFourSquareSessionManager.h
//  World Traweler
//
//  Created by David Pirih on 16.09.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface PPFourSquareSessionManager : AFHTTPSessionManager

+(instancetype)sharedClient;

@end
