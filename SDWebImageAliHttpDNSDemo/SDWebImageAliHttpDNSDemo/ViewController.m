//
//  ViewController.m
//  SDWebImageAliHttpDNSDemo
//
//  QQ:251180323 欢迎交流
//
//  Created by liaoyp on 16/8/30.
//  Copyright © 2016年 liaoyp. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "SDWebImage/SDImageCache.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 官方Demo
    /**
     
     
     // 初始化HTTPDNS
     httpdns = [HttpDnsService sharedInstance];
     
     
     // 异步网络请求
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
     
     NSString *originalUrl = @"http://bt.img.17gwx.com/topic/0/92/e1NdZQ/600x330";
     NSURL *url = [NSURL URLWithString:originalUrl];
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
     // 同步接口获取IP地址，由于我们是用来进行url访问请求的，为了适配IPv6的使用场景，我们使用getIpByHostInURLFormat接口
     // 注* 当您使用IP形式的URL进行网络请求时，IPv4与IPv6的IP地址使用方式略有不同：
     // IPv4: http://1.1.1.1/path
     // IPv6: http://[2001:db8:c000:221::]/path
     // 因此我们专门提供了适配URL格式的IP获取接口getIpByHostInURLFormat
     // 如果您只是为了获取IP信息而已，可以直接使用getIpByHost接口
     NSString *ip = [httpdns getIpByHostInURLFormat:url.host];
     if (ip) {
     // 通过HTTPDNS获取IP成功，进行URL替换和HOST头设置
     NSLog(@"Get IP(%@) for host(%@) from HTTPDNS Successfully!", ip, url.host);
     NSRange hostFirstRange = [originalUrl rangeOfString:url.host];
     if (NSNotFound != hostFirstRange.location) {
     NSString *newUrl = [originalUrl stringByReplacingCharactersInRange:hostFirstRange withString:ip];
     NSLog(@"New URL: %@", newUrl);
     request.URL = [NSURL URLWithString:newUrl];
     [request setValue:url.host forHTTPHeaderField:@"host"];
     }
     }
     NSHTTPURLResponse* response;
     NSError *error;
     NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
     if (error != nil) {
     NSLog(@"Error: %@", error);
     } else {
     NSLog(@"Response: %@",response);
     }
     
     // 异步接口获取IP
     ip = [httpdns getIpByHostAsyncInURLFormat:url.host];
     if (ip) {
     // 通过HTTPDNS获取IP成功，进行URL替换和HOST头设置
     NSLog(@"Get IP(%@) for host(%@) from HTTPDNS Successfully!", ip, url.host);
     NSRange hostFirstRange = [originalUrl rangeOfString:url.host];
     if (NSNotFound != hostFirstRange.location) {
     NSString *newUrl = [originalUrl stringByReplacingCharactersInRange:hostFirstRange withString:ip];
     NSLog(@"New URL: %@", newUrl);
     request.URL = [NSURL URLWithString:newUrl];
     [request setValue:url.host forHTTPHeaderField:@"host"];
     }
     }
     
     data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
     if (error != nil) {
     NSLog(@"Error: %@", error);
     } else {
     NSLog(@"Response: %@",response);
     }
     
     
     // 测试黑名单中的域名
     ip = [httpdns getIpByHostAsyncInURLFormat:@"www.taobao.com"];
     if (!ip) {
     NSLog(@"由于在降级策略中过滤了www.taobao.com，无法从HTTPDNS服务中获取对应域名的IP信息");
     }
     });
     *
     */
    
    [[SDImageCache sharedImageCache] clearDisk];
    
    
    UIImageView  *sd_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.618, self.view.frame.size.height / 2)];
    sd_imageView.center = self.view.center;
    sd_imageView.contentMode  = UIViewContentModeScaleAspectFill;
    sd_imageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:sd_imageView];
    
//    [sd_imageView sd_setImageWithURL:[NSURL URLWithString:@"https://aecpm.alicdn.com/simba/img/TB1H9zdLXXXXXbIXpXXSutbFXXX.jpg"]];
    [sd_imageView sd_setImageWithURL:[NSURL URLWithString:@"http://bt.img.17gwx.com/topic/0/92/e1NdZQ/600x330"]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
