//
//  ViewController.m
//  AFNetworkingDemo
//
//  Created by huangyibiao on 15/11/15.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "ViewController.h"
#import "HYBNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // 通常放在appdelegate就可以了
  [HYBNetworking updateBaseUrl:@"http://apistore.baidu.com"];
  [HYBNetworking enableInterfaceDebug:YES];
  
  /*
   [HYBNetworking.m：in line: 189]-->[message:
   absoluteUrl: http://apistore.baidu.com/microservice/cityinfo?cityname=%E5%8C%97%E4%BA%AC
   params:(null)
   response:{
   errNum = 0;
   retData =     {
   cityCode = 101010100;
   cityName = "\U5317\U4eac";
   provinceName = "\U5317\U4eac";
   telAreaCode = 010;
   zipCode = 100000;
   };
   retMsg = success;
   }
   ]
   */
  
  // 测试GET API
  NSString *url = @"http://apistore.baidu.com/microservice/cityinfo?cityname=beijing";
  //   设置请求类型为text/html类型
  //  [HYBNetworking configRequestType:kHYBRequestTypePlainText];
  //  [HYBNetworking configResponseType:kHYBResponseTypeData];
  [HYBNetworking getWithUrl:url params:nil progress:^(int64_t bytesRead, int64_t totalBytesRead) {
    NSLog(@"progress: %f, cur: %lld, total: %lld",
          (bytesRead * 1.0) / totalBytesRead,
          bytesRead,
          totalBytesRead);
  } success:^(id response) {
    
  } fail:^(NSError *error) {
    
  }];
  
  
  // 测试POST API：
  // 假数据
  NSDictionary *postDict = @{ @"urls": @"http://www.henishuo.com/git-use-inwork/",
                              @"goal" : @"site",
                              @"total" : @(123)
                              };
  NSString *path = @"/urls?site=www.henishuo.com&token=bRidefmXoNxIi3Jp";
  // 由于这里有两套基础路径，用时就需要更新
  [HYBNetworking updateBaseUrl:@"http://data.zz.baidu.com"];
  [HYBNetworking postWithUrl:path params:postDict success:^(id response) {
    
  } fail:^(NSError *error) {
    
  }];
}



@end
