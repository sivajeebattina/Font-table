//
//  fontTable.m
//  fontTable
//
//  Created by pcs20 on 9/16/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

#import "fontTable.h"
#import "fontViewController.h"


@interface fontTable (){

    NSMutableArray *fontNamesArray;
}

@end

@implementation fontTable

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    fontNamesArray=(NSMutableArray *)[UIFont familyNames];
   
    //fontNamesArray=[[NSMutableArray alloc] initWithObjects:@"Arial",@"Courier",@"Arial Rounded MT Bold",@"Damascus",@"Georgia",@"Helvetica",@"Verdana",@"Times New Roman",@"Gill Sans",@"Copperplate", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return fontNamesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fontName"];
    
    // Configure the cell...
    
    NSString *fontName=[fontNamesArray objectAtIndex:indexPath.row];
    cell.textLabel.text=fontName;
    cell.textLabel.font=[UIFont fontWithName:fontName size:18];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]isEqualToString:@"fontText"]) {
        fontViewController *fontView=[segue destinationViewController];
        NSIndexPath *selectedIndexPath=[self.tableView indexPathForSelectedRow];
        NSString *fontName=[fontNamesArray objectAtIndex:selectedIndexPath.row];
        
        fontView.fontName=fontName;
        
    }
    
    
    
}

@end
