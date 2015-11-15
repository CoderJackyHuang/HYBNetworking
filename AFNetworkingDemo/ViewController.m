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
  NSString *url = @"/microservice/cityinfo?cityname=北京";
  [HYBNetworking getWithUrl:url success:^(id response) {
    
  } fail:^(NSError *error) {
    
  }];
  
  
  // 测试POST API：
  // 假数据
  NSDictionary *postDict = @{ @"urls": @[@"http://www.henishuo.com/git-use-inwork/",
                                         @"http://www.henishuo.com/ios-open-source-hybloopscrollview/"]
                              };
NSString *path = @"/urls?site=www.henishuo.com&token=bRidefmXoNxIi3Jp";
  // 由于这里有两套基础路径，用时就需要更新
  [HYBNetworking updateBaseUrl:@"http://data.zz.baidu.com"];
  [HYBNetworking postWithUrl:path params:postDict success:^(id response) {
    
  } fail:^(NSError *error) {
    
  }];
  
  [HYBNetworking updateBaseUrl:@""];
}



@end
