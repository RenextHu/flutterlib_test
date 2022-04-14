//
//  HHBBViewController.m
//  gitlibtest
//
//  Created by bh_iOS on 03/31/2022.
//  Copyright (c) 2022 bh_iOS. All rights reserved.
//

#import "HHBBViewController.h"
#import "HHBBAppDelegate.h"
#import <Flutter/Flutter.h>

@interface HHBBViewController ()
@property(nonatomic)FlutterViewController *gFlutterViewController;

@property(nonatomic)FlutterEngine *gFlutterEngine;
@end

@implementation HHBBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemBlueColor];
    self.gFlutterEngine =((HHBBAppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    // Do any additional setup after loading the view.
    
     self.gFlutterViewController = [[FlutterViewController alloc]  initWithEngine:self.gFlutterEngine nibName:nil bundle:nil];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(100, 100, 200, 50)];
    [button setBackgroundColor:[UIColor systemRedColor]];
    [button setTitle:@"ClickMePushToFlutterVC" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
    button.tag=1;

    [self.view addSubview:button];
    
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(100, 300, 200, 50)];
    [button2 setBackgroundColor:[UIColor systemGreenColor]];
    [button2 setTitle:@"ClickMePushToFlutterVC2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(btn_click:)
      
      forControlEvents:UIControlEventTouchUpInside];
    button2.tag=2;
    [self.view addSubview:button2];
}

- (void)btn_click:(UIButton*)sender {
    
 
    if (sender.tag==2) {
        FlutterMethodChannel* flutterMethodChannel = [FlutterMethodChannel  methodChannelWithName:@"two_page" binaryMessenger:self.gFlutterViewController.binaryMessenger] ;
        [flutterMethodChannel invokeMethod:@"two"  arguments:@{@"two":@"绿色dddd"}];

            if (self.navigationController) {
                [self.navigationController pushViewController:self.gFlutterViewController animated:YES];
            } else {
                self.gFlutterViewController.modalPresentationStyle  = UIModalPresentationOverFullScreen;
                 [self presentViewController:self.gFlutterViewController animated:YES completion:nil];
            }
        [flutterMethodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            NSLog(@"2222llll--------%@>>>>>%@",call.method,call.arguments);
            if (self.navigationController) {
                [self.navigationController popViewControllerAnimated:YES];
            } else {
                [self dismissViewControllerAnimated:true completion:nil];
    
            }
//            [UIAlertAction ]
        }];


    }else{
        FlutterMethodChannel* flutterMethodChannel = [FlutterMethodChannel methodChannelWithName:@"one_page" binaryMessenger:self.gFlutterViewController.binaryMessenger];
        [flutterMethodChannel invokeMethod:@"one" arguments:@{@"one":@"红色dddd"}];

            if (self.navigationController) {
                [self.navigationController pushViewController:self.gFlutterViewController animated:YES];
            } else {
                self.gFlutterViewController.modalPresentationStyle  = UIModalPresentationOverFullScreen;
                 [self presentViewController:self.gFlutterViewController animated:YES completion:nil];
            }
        [flutterMethodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            NSLog(@"-1111hhhh-------%@>>>>>%@",call.method,call.arguments);
            
            if (self.navigationController) {
                [self.navigationController popViewControllerAnimated:YES];
            } else {
                [self dismissViewControllerAnimated:true completion:nil];
    
            }
            
        }];
    }
//
//    return;;

//    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
//    if (self.navigationController) {
//        [self.navigationController pushViewController:flutterViewController animated:YES];
//    } else {
//        flutterViewController.modalPresentationStyle  = UIModalPresentationOverFullScreen;
////    flutterViewController setInitialRoute:@""
//        [self presentViewController:flutterViewController animated:YES completion:nil];
//    }
}

 - (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
