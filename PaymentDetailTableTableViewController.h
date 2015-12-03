//
//  PaymentDetailTableTableViewController.h
//  MortgageEasy
//
//  Created by Alex Lee on 25/11/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentDetailTableTableViewController : UITableViewController

@property(nonatomic)  float   flatPrice, loanRate, loanAmount, monthlyRePayment;
@property(nonatomic)  int loanYear;

@end
