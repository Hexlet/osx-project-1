//
//  City.h
//  ControlWork
//
//  Created by Кирилл Каюмов on 08/12/13.
//  Copyright (c) 2013 MyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject {
    NSString *name;
    int age, population;
}

-(void) setName: (NSString *) name age: (int) age population: (int) population;
-(int) getAge;
-(int) getPopulation;
-(NSString *) getName;
-(void) nextDay;

@end
