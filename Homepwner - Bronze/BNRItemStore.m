//
//  BNRItemStore.m
//  Homepwner
//
//  Created by temp on 1/28/14.
//  Copyright (c) 2014 com.WAM. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemStore

+ (BNRItemStore *)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    if (!sharedStore)
        sharedStore = [[super allocWithZone:nil] init];
    
    return sharedStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (id)init
{
    self = [super init];
    if (self) {
        allItems = [[NSMutableArray alloc] initWithCapacity:2];

        allItems[0] = [[NSMutableArray alloc] init];
        allItems[1] = [[NSMutableArray alloc] init];    }
    
    return self;
}


- (NSArray *)allItems
{
    return allItems;
}

- (BNRItem *)createItem
{
    BNRItem *p = [BNRItem randomItem];
    
    NSInteger section = 0;
    if(p.valueInDollars > 50)
        section = 1;
    [allItems[section] addObject:p];
    
    return p;
}


@end
