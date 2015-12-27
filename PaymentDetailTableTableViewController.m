//
//  PaymentDetailTableTableViewController.m
//  MortgageEasy
//
//  Created by Alex Lee on 25/11/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import "PaymentDetailTableTableViewController.h"
#import "PaymentDetailCell.h"
#import "MortgagePayment.h"
#import "AppDelegate.h"

@interface PaymentDetailTableTableViewController ()

@end

@implementation PaymentDetailTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView sizeToFit];
    
    AppDelegate *ad = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    self.interestDetail = ad.prePaymentDetail;
    NSLog(@"prePaymentDetail size = %d", (int)ad.prePaymentDetail.count);
    NSLog(@"interestDetail size = %d", (int)ad.prePaymentDetail.count);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    //NSInteger rCount;
    //return number of prepayment + summary per year + title bar
    //rCount = self.interestDetail.count + self.interestDetail.count/12 +1;
    //rCount = self.interestDetail.count;
    return [self.interestDetail count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *simpleTableIdentifier = @"PaymentDetailCell";
    MortgagePayment *m;
    
    PaymentDetailCell *cell = (PaymentDetailCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil)
    {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"PaymentDetailCell" owner:self options:nil];
        cell = [nibArray objectAtIndex:0];
    }
    
    AppDelegate *ad = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    m = [ad.prePaymentDetail objectAtIndex:indexPath.row];
    
    
    [cell.tenorLabel setText:[NSString stringWithFormat:@"%d", m.tenor]];
    [cell.principleLabel setText:[NSString stringWithFormat:@"%0.2f", m.principle]];
    [cell.interestLabel setText:[NSString stringWithFormat:@"%0.2f", m.interest]];
    [cell.totalLabel setText:[NSString stringWithFormat:@"%0.2f", m.repayment]];
    [cell.remainingLabel setText:[NSString stringWithFormat:@"%0.2f", m.total - (m.tenor*m.repayment)]];
    

    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*CGSize cellSize = [[[_stepsArray objectAtIndex:indexPath.row]content] sizeWithFont:[UIFont boldSystemFontOfSize:18.0f] constrainedToSize:CGSizeMake(528.0f, CGFLOAT_MAX)lineBreakMode:NSLineBreakByWordWrapping];*/
    return 70;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
