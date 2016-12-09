//
//  ViewController.m
//  lianxi
//
//  Created by 崔国伟 on 16/5/11.
//  Copyright © 2016年 崔国伟. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MKMapView.h>
@interface ViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager *_manager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getCurrentLocation];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark 获取当前位置
- (void)getCurrentLocation{
    
    //    判断当前定位服务是否打开
    if(![CLLocationManager locationServicesEnabled]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请打开定位服务" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"打开", nil];
        [alert show];
        return;
    }
    _manager = [[CLLocationManager alloc]init];
    //    设置代理
    _manager.delegate = self;
    //    程序使用期间允许访问位置信息
    if([_manager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [_manager requestWhenInUseAuthorization];
    }
    //    定位的精确度
    _manager.desiredAccuracy = kCLLocationAccuracyBest;//精确,只需使用一次再将其关闭
    //    多少范围以外再去更新位置
    _manager.distanceFilter = 1000;
    //    开始定位
    [_manager startUpdatingLocation];
}


#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    //    一般只取数组locations的第0个元素
    CLLocation *location = locations.firstObject;
    /**
     typedef struct {
     CLLocationDegrees latitude;    //纬度
     CLLocationDegrees longitude;   //经度
     } CLLocationCoordinate2D;      //地理位置坐标
     */
    //    39.9 116.4
//    CLLocation *loc = [[location locationMarsFromEarth] locationBaiduFromMars];
//    NSLog(@"%@",loc);
//    self.coordinate = loc.coordinate;
//    NSLog(@"经纬度：%f - %f",location.coordinate.latitude,location.coordinate.longitude);
//    // 为了省电,关闭定位
//    [_manager stopUpdatingLocation];
//    
//    CLGeocoder *geo = [[CLGeocoder alloc]init];
//    //    反编码(解码)
//    [geo reverseGeocodeLocation:(CLLocation *) location  completionHandler:^(NSArray *placemarks, NSError *error) {
//        CLPlacemark *placemark = placemarks.firstObject;
//        //        if ([[placemark.locality substringFromIndex:placemark.locality.length - 1] isEqualToString:@"市"] ||[[placemark.locality substringFromIndex:placemark.locality.length - 1] isEqualToString:@"省"]) {
//        //            _currentLocation = [placemark.locality substringToIndex:placemark.locality.length - 1];
//        //        }else{
//        if (error) {
//            NSLog(@"error:%@",error.localizedDescription);
//            return;
//        }
//        if (!placemark.locality) {
//            _provinceMenu.textField.text = placemark.administrativeArea;//[placemark.addressDictionary objectForKey:@"State"]
//            if ([[placemark.administrativeArea substringFromIndex:[placemark.administrativeArea length] - 1] isEqualToString:@"市"]) {
//                _provinceMenu.textField.text = [placemark.administrativeArea substringToIndex:[placemark.administrativeArea length] - 1];
//            }else{
//                _provinceMenu.textField.text = [placemark.addressDictionary objectForKey:@"State"];
//            }
//            _cityMenu.textField.text = [placemark.addressDictionary objectForKey:@"City"];
//            _districtMenu.textField.text = placemark.subLocality;
//            NSLog(@"%@",placemark.addressDictionary);
//        }else{
//            if ([[[placemark.addressDictionary objectForKey:@"State"] substringFromIndex:[[placemark.addressDictionary objectForKey:@"State"] length] - 1] isEqualToString:@"市"]) {
//                _provinceMenu.textField.text = [[placemark.addressDictionary objectForKey:@"State"] substringToIndex:[[placemark.addressDictionary objectForKey:@"State"] length] - 1];
//            }else{
//                _provinceMenu.textField.text = [placemark.addressDictionary objectForKey:@"State"];
//            }
//            _cityMenu.textField.text = placemark.locality;
//            _districtMenu.textField.text = placemark.subLocality;
//            NSLog(@"%@",placemark.addressDictionary);
//        }
//        //        }
//        if (i < 1) {
//            [self confirm];
//            i++;
//        }
//    }];
}

//用户改变了当前程序访问位置信息权限
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    if (status != 4) {
        
        //        程序未获取访问用户位置信息权限
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请设置允许程序的返回位置信息" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
        
        
        
    }
    
    //    WFLog(@"%d",status);
}

@end
