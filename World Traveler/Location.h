//
//  Location.h
//  World Traweler
//
//  Created by David Pirih on 16.09.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "PPRecord.h"

@class Venue;

@interface Location : PPRecord

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * cc;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * crossStreet;
@property (nonatomic, retain) NSString * postalCode;
@property (nonatomic, retain) NSNumber * lng;
@property (nonatomic, retain) NSNumber * lat;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) Venue *venue;

@end
