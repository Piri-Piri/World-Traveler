//
//  FSCategory.h
//  World Traweler
//
//  Created by David Pirih on 16.09.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "PPRecord.h"

@class Venue;

@interface FSCategory : PPRecord

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * attribute;
@property (nonatomic, retain) Venue *venue;

@end
