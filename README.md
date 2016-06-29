# HYBNetworking
基于AFNetworking封装的网络层，支持自由配置请求头，自动缓存及可设置自动清除策略，支持常用的GET/POST/单文件上传、下载功能等，详情可以阅读文章讲解！

#安装

```
pod 'HYBNetworking', '~> 3.3.0'
```

#文章讲解

笔者的个人博客发表的讲解的文章：[基于AFNetworkgin2.5.2的网络封装](http://101.200.209.244/base-on-afnetworking-wrapper/)，此版本不再维护！

另外，最新更新到基于AFN3.0版本的，请阅读：[基于AFNetworking3.0的网络封装](http://101.200.209.244/base-on-afnetworking3-0-wrapper/)

#关注我

如果在使用过程中遇到问题，或者想要与我交流，可加入有问必答**QQ群：324400294**<br>
关注微信公众号：[**iOSDevShares**]()<br>
关注博客：[http://www.henishuo.com/](http://101.200.209.244/)


#LISENCE

MIT

#历史版本变化

* 1.1
  * 升级AFNetworking到2.5.4
  * 新增带上传进度的API和带进度的下载API，详细请阅读下面的博文
* 1.1.1
  * 修改原来默认URLEncode由YES改为NO。
* 1.1.2
  * 追加text/plain格式
* 1.1.3
  * 追加两个兼容性API，图片上传时可额外上传参数
* 2.0.0
  * 升级AFNetworking到3.0，基于AFNetworking3.0.4而写的版本
  * 支持iOS7.0及其以上版本
* 2.0.1
  * fix pod安装2.0.0却是1.1.3版本的问题
* 3.0.0
  * 简化API，以降低使用的要求
  * 增加GET/POST数据缓存、获取缓存大小、清空缓存功能
  * 接口增加刷新缓存功能
  * 增加取消所有请求、取消单个请求功能
  * 格式化打印日志
  * 增加对手动取消请求接口是否在失败时还回调的控制
* 3.1.0
  * fix download data can't start request.
* 3.2.0
  * 增加请求超时设置
  * 增加配置是否在网络异常（无网络）时自动尝试从本地读取缓存。
* 3.2.1
  * 完善无网状态下缓存的处理
* 3.2.2
  * 将download url存储修改
* 3.2.3
  * 修改默认requestType为plainText，以解决很多小伙伴们出现后台接收不到参数的问题！
* 3.3.0
  * 修改AFSessionManager获取方式为只使用一个，除非修改了BASEURL，否则一直使用同一个
  * 增加了自动清除缓存的策略，由开发者决定是否自动清除缓存，可设置上限大小
