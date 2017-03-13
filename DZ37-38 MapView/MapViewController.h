//
//  MapViewController.h
//  DZ37-38 MapView
//
//  Created by Vasilii on 07.03.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKMapView; //добавляем класс

@interface MapViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
