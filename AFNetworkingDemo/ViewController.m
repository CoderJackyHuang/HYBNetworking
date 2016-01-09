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
  // 设置请求类型为text/html类型
//  [HYBNetworking configRequestType:kHYBRequestTypePlainText];
//  [HYBNetworking configResponseType:kHYBResponseTypeData];
//  [HYBNetworking getWithUrl:url success:^(id response) {
//    
//  } fail:^(NSError *error) {
//    
//  }];
  
  
  // 测试POST API：
  // 假数据
  NSDictionary *postDict = @{ @"urls": @[@"http://www.henishuo.com/git-use-inwork/",
                                         @"http://www.henishuo.com/ios-open-source-hybloopscrollview/"]
                              };
NSString *path = @"/urls?site=www.henishuo.com&token=bRidefmXoNxIi3Jp";
  // 由于这里有两套基础路径，用时就需要更新
//  [HYBNetworking updateBaseUrl:@"http://data.zz.baidu.com"];
//  [HYBNetworking postWithUrl:path params:postDict success:^(id response) {
//    
//  } fail:^(NSError *error) {
//    
//  }];
  
  [HYBNetworking updateBaseUrl:@""];
  
  // 默认为NO，如果接口URL不支持URLEncode，则设置为NO
  [HYBNetworking shouldAutoEncodeUrl:NO];
  [HYBNetworking postWithUrl:@"http://pudding.cc/api/v1/config?apiKey=yuki_ios&auth1=404eb63678821d2378be1a792d83c647&auth2=aa9ca4ee73c92a55b13c71ac6980bfe5&brand=Apple&channelId=App%20Store&currentUserId=55abec46e597fac94b8b456c&deviceKey=359A864D-C74C-4304-AB78-E6731A94CDCB&fields=enable_category_lock%2Cfeatured_banner%2Crecommend_banner%2Cgame_banner%2Ccustom_entrances%2Cpromoted_apps%2CqZone_share_content%2Cweibo_share_content%2Cwechat_share_content%2Csetting_custom_entrances%2Cvalid_domains%2Cwebview_custom_entrances%2Cdownloader_NPS_enable%2Cdownloader_NPS_URL%2Cdownloader_NPS_version%2Cplayer_NPS_enable%2Cplayer_NPS_URL%2Cplayer_NPS_version%2Cpromotion_entrance%2Claunch_splashes%2Cin_review_version%2Cis_group_forbidden%2Cis_picture_forbidden%2Capp_store_version%2Cbeta_version%2Cmin_app_store_version%2Cmin_beta_version%2Cshop%2Cgame_count%2Cep_category_banner%2Ctoggle_voice_link_to_music&model=iPhone&os=iOS&osv=9.0.1&timestamp=1452265399&version=2.7.1" params:nil success:^(id response) {
    
  } fail:^(NSError *error) {
    
  }];
}



@end
