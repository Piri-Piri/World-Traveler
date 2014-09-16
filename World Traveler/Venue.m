//
//  Venue.m
//  World Traweler
//
//  Created by David Pirih on 16.09.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import "Venue.h"
#import "Contact.h"
#import "FSCategory.h"
#import "Location.h"
#import "Menu.h"


@implementation Venue

@dynamic name;
@dynamic id;
@dynamic categories;
@dynamic contact;
@dynamic location;
@dynamic menu;

+(NSString *)keyPathForResponseObject
{
    return @"response.venues";
}

@end
