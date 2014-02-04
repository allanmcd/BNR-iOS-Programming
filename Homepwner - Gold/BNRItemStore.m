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
        allItems = [[NSMutableArray alloc] init];
        BNRItem * endItem = [[BNRItem alloc]
                             initWithItemName:@"No more items"
                             valueInDollars:0
                             serialNumber:nil];
        [allItems addObject:endItem ];
    }
    return self;
}


- (NSArray *)allItems
{
    return allItems;
}

- (BNRItem *)createItem
{
    BNRItem *p = [BNRItem randomItem];
    
    [allItems insertObject:p atIndex:[allItems count]-1];
    
    return p;
}


@end
