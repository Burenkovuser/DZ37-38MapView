//
//  Student.m
//  DZ37-38 MapView
//
//  Created by Vasilii on 07.03.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "Student.h"

@interface Student()

@property(strong, nonatomic) NSArray* namesArray;
@property(strong, nonatomic) NSArray* surnamesArray;
@property(strong, nonatomic) NSArray* femaleNames;
@property(strong, nonatomic) CLGeocoder* geoCoder;


@end
@implementation Student

- (id)initWithStudentGeoInformationAndCenterPoint:(CLLocationCoordinate2D) centerPoint {
    
    //создаем студента с его данными
    
    self = [super init];
    
    if (self) {
        
        //self.distanceToMeeting = 0;
        
        //потребуются массивы имен, фамилий и координат
        self.namesArray = [NSArray array];
        self.surnamesArray = [NSArray array];
        self.femaleNames = [NSArray array];
        self.geoCoder = [[CLGeocoder alloc] init];
        
        // Все имена
        self.namesArray = [NSArray arrayWithObjects:@"Bob", @"Stanly", @"Jack", @"John", @"Vince", @"James", @"Anthony", @"Tony", @"Patrick", @"Tom", @"Brad", @"Finn", @"Fred", @"Wes", @"Sam", @"Steve", @"Bruce", @"Chris", @"Bobby", @"Terry", @"Jeff", @"Sterling", @"Lisa", @"Eva", @"Kira", @"Annie", @"Monica", @"Rebecca", @"Jenny", @"Sandra", @"Nicole", @"Victoria", @"Mary", @"Marina", @"Lily", @"Christie", @"Anna", @"Nina", @"Polina", @"Klara", nil];
        
        // Женские имена
        self.femaleNames = [NSArray arrayWithObjects:@"Lisa", @"Eva", @"Kira", @"Annie", @"Monica", @"Rebecca", @"Jenny", @"Sandra", @"Nicole", @"Victoria", @"Mary", @"Marina", @"Lily", @"Christie", @"Anna", @"Nina", @"Polina", @"Klara", nil];
        
        self.name = [NSString stringWithFormat:@"%@", [self.namesArray objectAtIndex:arc4random_uniform((int)[self.namesArray count])]];
    }
    //выбираем пол в зависимости от имени
    if ([self.femaleNames containsObject:self.name]) {
        self.gender = @"Female";
    }else{
        self.gender = @"Male";
    }
    
    self.surnamesArray = [NSArray arrayWithObjects:@"White", @"Black", @"Red", @"Summerset", @"Yellow", @"Brown", @"Grey", @"Orange", @"Hanks", @"Pitt", @"Price", @"Durst", @"Borland", @"Rivers", @"Rogers", @"Willis", @"Hamswort", @"Labonte", @"O`Quinn", @"Bridges", @"Marlen", @"Freeman", @"Ford", @"Allen", @"Norton", @"Catch", @"Wildmore", @"Davidson", @"Will", @"Potter", @"Wesley", @"Parker", @"Marsh", @"Broflovski", @"Cartman", @"Linder", @"Walker", @"Diesel", @"McFly", nil];
  
    self.surname = [NSString stringWithFormat:@"%@", [self.surnamesArray objectAtIndex:arc4random_uniform((int)[self.surnamesArray count])]];
    
      //  День рождения делаем через NSDate, рандомно от какой-то даты. например 01.09.1993 + 5 лет диапазон для студента
    
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"dd.MM.yyyy"];
    NSDate *startingDate = [formater dateFromString:@"01.09.1993"];
    
    // 5 лет в секундах = 60*60*24*365*5
    self.dateOfBirth = [startingDate dateByAddingTimeInterval:arc4random_uniform(60 * 60 * 24 * 365 *5)];
    
    // генерируем геопозицию для студента
    if (centerPoint.latitude && centerPoint.longitude) {
        NSLog(@"GOT IT - %.2f, %.2f", centerPoint.latitude, centerPoint.longitude);
        
        CGFloat deltaX, deltaY;
        // диапазон дельт по широте и долготе (+ - 0.05)
        deltaX = (double)arc4random_uniform((20001) - 10000) / 200000;
        deltaY = (double)arc4random_uniform((20001) - 10000) / 200000;
        
        NSLog(@"deltas - %f, %f", deltaY, deltaX);
        
        self.coordinate = CLLocationCoordinate2DMake(centerPoint.latitude + deltaX, centerPoint.longitude + deltaY);
        
        NSLog(@"Coordinates: latitude - %f, longitude - %f", self.coordinate.latitude, self.coordinate.longitude);
        
        // нужно сделать адрес!!!
        // centerPoint - наша геолокация, относительно которой генерируются координаты студентов.
        
        CLLocation* location = [[CLLocation alloc] initWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
        
        if ([self.geoCoder isGeocoding]) {
            
            [self.geoCoder cancelGeocode];
            
        }
        
        [self.geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            
            if (error) {
                
                self.address = [error localizedDescription];
                
            } else {
                
                if ([placemarks count] > 0) {
                    
                    MKPlacemark* placemark = [placemarks firstObject];
                    
                    NSString* nameOfStreet = [placemark.addressDictionary valueForKey:@"Street"];
                    
                    //                    self.address = [placemark.addressDictionary description];
                    //
                                        NSLog(@"ADDRESS INFO - %@", self.address);
                    
                    if ([nameOfStreet length] == 0) {
                        
                        nameOfStreet = @"No any names of streets";
                        
                    }
                    
                    self.address = nameOfStreet;
                    
                } else {
                    
                    self.address = @"No placemarks found!";
                    
                }
                
            }
            
        }];
        // title - Имя и фамилия, subtitle - год рождения
        
        self.title = [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
        
        self.subtitle = [NSString stringWithFormat:@"%@", [formater stringFromDate:self.dateOfBirth]];

    }
    
    return self;
}


@end
