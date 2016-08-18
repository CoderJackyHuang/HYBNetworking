
Pod::Spec.new do |s|
  s.name         = "HYBNetworking"
  s.version      = "3.3.1"
  s.summary      = "基于AFNetworking封装的简单易用网络库，提供了常用的API,2.0以下版本为基于AFN2.5.2封装的，2.0以上版本为基于AFN3.0封装的"

  s.description  = <<-DESC
                   基于AFNetworking封装的网络库，提供了常用的API，调用简单。若在使用过程中有问题，请反馈与作者，以便完善之！3.1.0以下版本是基于AFNetworking2.5.2版本封装的，而2.0.0及其以上版本是基于AFNetworking3.0及其以上版本所封装的，大家注意版本！
                   DESC
  s.homepage     = "https://github.com/CoderJackyHuang/HYBNetworking"
  s.license      = "MIT"
  s.author             = { "huangyibiao" => "" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/CoderJackyHuang/HYBNetworking.git", :tag => "3.3.1" }
  s.source_files  = "HYBNetworking", "*.{h,m}"
  s.requires_arc = true
  s.dependency "AFNetworking", "~> 3.1.0"

end
