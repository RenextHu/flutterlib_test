//
//  HHBBViewController.m
//  gitlibtest
//
//  Created by bh_iOS on 03/31/2022.
//  Copyright (c) 2022 bh_iOS. All rights reserved.
//

#import "HHBBViewController.h"

@interface HHBBViewController ()

@end

@implementation HHBBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemBlueColor];
    self.gFlutterEngine =((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    // Do any additional setup after loading the view.
    
     self.gFlutterViewControllerl = [[FlutterViewController alloc]  initWithEngine:self.gFlutterEngine nibName:nil bundle:nil];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(100, 100, 200, 50)];
    [button setBackgroundColor:[UIColor greenColor]];
    [button setTitle:@"ClickMePushToFlutterVC" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(100, 300, 200, 50)];
    [button2 setBackgroundColor:[UIColor redColor]];
    [button2 setTitle:@"ClickMePushToFlutterVC2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(btn_click:)
      
      forControlEvents:UIControlEventTouchUpInside];
    button2.tag=2;
    [self.view addSubview:button2];
}

- (void)btn_click:(UIButton*)sender {
    
 
    if (sender.tag==1) {
        FlutterMethodChannel* flutterMethodChannel = [[FlutterMethodChannel alloc]initWithName:@"two_page" binaryMessenger:self.gFlutterEngine.binaryMessenger codec:nil] ;
        [flutterMethodChannel invokeMethod:@"two" arguments:@{@"name":@"zzzzz"} result:^(id  _Nullable result) {

        }];

            if (self.navigationController) {
                [self.navigationController pushViewController:self.gFlutterViewControllerl animated:YES];
            } else {
                self.gFlutterViewControllerl.modalPresentationStyle  = UIModalPresentationOverFullScreen;
                 [self presentViewController:self.gFlutterViewControllerl animated:YES completion:nil];
            }
        [flutterMethodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            NSLog(@"--------%@>>>>>%@",call.method,call.arguments);
        }];


    }else{
        FlutterMethodChannel* flutterMethodChannel = [[FlutterMethodChannel alloc]initWithName:@"one_page" binaryMessenger:self.gFlutterEngine.binaryMessenger codec:nil] ;
        [flutterMethodChannel invokeMethod:@"one" arguments:@{@"name":@"zzzzz"} result:^(id  _Nullable result) {

        }];

            if (self.navigationController) {
                [self.navigationController pushViewController:self.gFlutterViewControllerl animated:YES];
            } else {
                self.gFlutterViewControllerl.modalPresentationStyle  = UIModalPresentationOverFullScreen;
                 [self presentViewController:self.gFlutterViewControllerl animated:YES completion:nil];
            }
        [flutterMethodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            NSLog(@"--------%@>>>>>%@",call.method,call.arguments);
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
