//
//  ViewController.m
//  LHNDemoiOS
//
//  Created by Justin Schneck on 12/7/15.
//  Copyright © 2015 LiveHelpNow. All rights reserved.
//

#import "ViewController.h"
#import <LiveHelpNow/LiveHelpNow.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [LHNChatSession prechatFormForWindow:0 completion:^(NSArray *fieldSet) {
//        NSLog(@"Prechat Field Set: %@", fieldSet);
//    } error:^(NSError *error) {
//        NSLog(@"Prechat Field Set error: %@", error);
//    }];
    
    LHNVisitor *visitor = [[LHNVisitor alloc]initWithDepartment:0 completion:^{
        LHNChatSession *chatSesison = [[LHNChatSession alloc ]initWithWindow:0 prechat:@{@"Full Name":@"Justin Schneck", @"email":@"testios@thisplace.com", @"Question":@"This Chat was started form iOS SDK"}];
    } error:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
