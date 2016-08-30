//
//  ViewController.m
//  TestViewFrame
//
//  Created by 益平廖 on 16/8/15.
//  Copyright © 2016年 liaoyp. All rights reserved.
//

#import "ViewController.h"
#import "BTRectangle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BTRectangle *rectxx = [[BTRectangle alloc] init];
    NSLog(@"%@",[rectxx description]);
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(10,10, 100, 100)];
    redView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:redView];
    
    UIView *redView1 = [[UIView alloc] initWithFrame:CGRectMake(100, 0, 100, 100)];
    redView1.backgroundColor = [UIColor orangeColor];
    redView1.alpha = 0.5;
    [self.view addSubview:redView1];
    redView1.layer.anchorPoint = CGPointMake(0.1, 0.9);
    
    redView.layer.zPosition = 1.0;
    
    redView.layer.cornerRadius = 20.0f;
//    self.layerView2.layer.cornerRadius = 20.0f;
    
    //add a border to our layers
//    redView.layer.borderWidth = 5.0f;
//    self.layerView2.layer.borderWidth = 5.0f;
    
    //add a shadow to layerView1
    redView.layer.shadowOpacity = 0.618f;
//    redView.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
//    redView.layer.shadowColor = [UIColor orangeColor].CGColor;
    //    self.layerView1.layer.shadowRadius = 5.0f;
    
    
//    CGMutablePathRef squarePath = CGPathCreateMutable();
//    CGPathAddRect(squarePath, NULL, redView.bounds);
//    redView.layer.shadowPath = squarePath;
//    CGPathRelease(squarePath);
    
    UIImageView *redImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10,200, 100, 100)];
    redImageView.image = [UIImage imageNamed:@"app_120.png"];
    [self.view addSubview:redImageView];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = redImageView.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"120.png"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    
    redImageView.layer.mask = maskLayer;

    
    
//    CGFontRelease(squarePath);
//    Create a circular shadow
//    CGMutablePathRef circlePath = CGPathCreateMutable();
//    CGPathAddEllipseInRect(circlePath, NULL, self.layerView2.bounds);
//    self.layerView2.layer.shadowPath = circlePath; CGPathRelease(circlePath);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
