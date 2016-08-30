//
//  AppDelegate.m
//  SDWebImageAliHttpDNSDemo
//
//  Created by liaoyp on 16/8/30.
//  Copyright © 2016年 liaoyp. All rights reserved.
//

#import "AppDelegate.h"
#import <AlicloudHttpDNS/AlicloudHttpDNS.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [self configureAliHttpDNSService];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - private


/**
 *  配置DNS服务
 */
- (void)configureAliHttpDNSService
{
    HttpDnsService *httpdns = [HttpDnsService sharedInstance];
   
    // 设置AccoutID
    [httpdns setAccountID:139450];
    
    // 为HTTPDNS服务设置降级机制
    [httpdns setDelegateForDegradationFilter:(id < HttpDNSDegradationDelegate >)self];
    // 允许返回过期的IP
    [httpdns setExpiredIPEnabled:YES];
    
    // edited
    NSArray *preResolveHosts = @[ @"www.aliyun.com", @"www.taobao.com", @"gw.alicdn.com", @"www.tmall.com" ];
    // 设置预解析域名列表
    [httpdns setPreResolveHosts:preResolveHosts];
}

/*
 * 降级过滤器，您可以自己定义HTTPDNS降级机制
 */
- (BOOL)shouldDegradeHTTPDNS:(NSString *)hostName {
    NSLog(@"Enters Degradation filter.");
    // 根据HTTPDNS使用说明，存在网络代理情况下需降级为Local DNS
    if ([self p_configureProxies]) { //是否进行本地的DNS处理.
        NSLog(@"Proxy was set. Degrade!");
        return YES;
    }
    
    return NO;
}


/**
 *  本地是否有代理对象
 */
- (BOOL)p_configureProxies
{
    NSDictionary *proxySettings = CFBridgingRelease(CFNetworkCopySystemProxySettings());
    
    NSArray *proxies = nil;
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://api.m.taobao.com"];
    
    proxies = CFBridgingRelease(CFNetworkCopyProxiesForURL((__bridge CFURLRef)url,
                                                           (__bridge CFDictionaryRef)proxySettings));
    if (proxies > 0)
    {
        NSDictionary *settings = [proxies objectAtIndex:0];
        NSString *host = [settings objectForKey:(NSString *)kCFProxyHostNameKey];
        NSString *port = [settings objectForKey:(NSString *)kCFProxyPortNumberKey];
        
        if (host || port)
        {
            return YES;
        }
    }
    return NO;
}



@end
