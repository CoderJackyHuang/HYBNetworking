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
  
  // 设置GET、POST请求都缓存
  [HYBNetworking cacheGetRequest:YES shoulCachePost:YES];
  
  // 测试GET API
  NSString *url = @"http://apistore.baidu.com/microservice/cityinfo?cityname=beijing";
  //   设置请求类型为text/html类型
  //  [HYBNetworking configRequestType:kHYBRequestTypePlainText];
  //  [HYBNetworking configResponseType:kHYBResponseTypeData];
  // 如果请求回来的数据是业务数据，但是是失败的，这时候需要外部开发人员才能判断是业务失败。
  // 内部处理是只有走failure的才能判断为无效数据，才不会缓存
  // 如果设置为YES,则每次会去刷新缓存，也就是不会读取缓存，即使已经缓存起来
  // 新下载的数据会重新缓存起来
  [HYBNetworking getWithUrl:url refreshCache:NO params:nil progress:^(int64_t bytesRead, int64_t totalBytesRead) {
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
  // 每次刷新缓存
  // 如果获取到的业务数据是不正确的，则需要下次调用时设置为YES,表示要刷新缓存
// HYBURLSessionTask *task =
  [HYBNetworking postWithUrl:path refreshCache:YES params:postDict success:^(id response) {
    
  } fail:^(NSError *error) {
    
  }];
  
  // 取消全部请求
//  [HYBNetworking cancelAllRequest];
  
  // 取消单个请求方法一
//  [HYBNetworking cancelRequestWithURL:path];
  
  // 取消单个请求方法二
//  [task cancel];
  
  NSLog(@"%lld", [HYBNetworking totalCacheSize]);
  [HYBNetworking clearCaches];
}



@end
