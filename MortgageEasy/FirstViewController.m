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

@synthesize flatPrice, loanAmount, loanRate, loanRatio, loanYear;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Calculate:(id)sender{
    NSLog(@"Value of flatPrice is %@", flatPrice.text);
    NSLog(@"Value of loanAmount is %@", loanAmount.text);
    NSLog(@"Value of loanRate is %@", loanRate.text);
    NSLog(@"Value of loanRatio is %f", loanRatio.value);
    NSLog(@"Value of loanYear is %f", loanYear.value);
}

-(IBAction)updateLoadAmount:(id)sender{
    loanAmount.text = flatPrice.text;
}

@end
