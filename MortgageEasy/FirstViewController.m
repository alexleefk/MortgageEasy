//
//  FirstViewController.m
//  MortgageEasy
//
//  Created by Alex Lee on 19/11/15.
//  Copyright © 2015 Alex Lee. All rights reserved.
//

#import "FirstViewController.h"
#include <math.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSDecimalNumber) calMonthlyRePayment :(NSDecimalNumber) P, 
                    rates:(NSDecimalNumber) r,
                    tenor:(NSDecimalNumber) t
{
    r=r/12;
    t=t*12;
    
    return (r*P*pow((1+r),t))/(pow((1+r),t)-1)

}

@end
