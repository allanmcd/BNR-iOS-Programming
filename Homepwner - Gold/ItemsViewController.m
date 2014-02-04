//
//  ItemsViewController.m
//  Homepwner
//
//  Created by temp on 1/28/14.
//  Copyright (c) 2014 com.WAM. All rights reserved.
//

#import "ItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"


@implementation ItemsViewController

- (id)init
{
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Homepwner - bg.png"]];
    NSLog(@"Img W:%.0f H:.0f",)
    [bgImage setFrame:self.tableView.frame];
    NSLog(@"H:%.0f W:%.0f",self.tableView.frame.size.width,self.tableView.frame.size.height);
    self.tableView.backgroundView = bgImage;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Check for a reusable cell first, use that if it exists
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    // If there is no reusable cell of this type, create a new one
    if (!cell) {
        // Create an instance of UITableViewCell, with default appearance
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier:@"UITableViewCell"];
    }
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    BNRItem *p = [[[BNRItemStore sharedStore] allItems]
                  objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[p description]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView
     heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = 44;
    NSInteger nRows =  [[[BNRItemStore sharedStore] allItems] count];
    if([indexPath row] != (nRows - 1))
        rowHeight = 60.0;
    return rowHeight;
}
@end
