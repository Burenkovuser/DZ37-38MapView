//
//  MapViewController.m
//  DZ37-38 MapView
//
//  Created by Vasilii on 07.03.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h> //импортируем фреймвор

@interface MapViewController ()<MKMapViewDelegate> //делаем контроллер делегатом карты


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - mark MKMapViewDelegate


- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
    
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    
}

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView {
    
}
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    
}
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {
    
}

- (void)mapViewWillStartRenderingMap:(MKMapView *)mapView {
    
}
- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered{
    
}
@end
