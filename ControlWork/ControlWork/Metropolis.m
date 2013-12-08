//
//  Metropolis.m
//  ControlWork
//
//  Created by Кирилл Каюмов on 08/12/13.
//  Copyright (c) 2013 MyCompany. All rights reserved.
//

#import "Metropolis.h"

@implementation Metropolis

-(void) createCity:(NSString *)city atIndex:(int)index withPopulation:(int)population {
    City *currentCity = [[City alloc] init];
    [currentCity setName:city age:0 population:population];
    
    array[index] = currentCity;
}

-(City *) getCityAtIndex:(int)index {
    return array[index];
}

@end
