//
//  Student.h
//  DZ37-38 MapView
//
//  Created by Vasilii on 07.03.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MapViewController.h"


@interface Student : NSObject <MKAnnotation> // Реализовали тут протокол, чтобы объекты данного класса отображать на карте


@property(strong, nonatomic) NSString* name;
@property(strong, nonatomic) NSString* surname;
@property(strong, nonatomic) NSString* gender;
@property (assign, nonatomic) NSDate* dateOfBirth;
@property (strong, nonatomic) NSString* address;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


- (id)initWithStudentGeoInformationAndCenterPoint:(CLLocationCoordinate2D) centerPoint;

@end
