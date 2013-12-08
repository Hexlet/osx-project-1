//
//  City.m
//  ControlWork
//
//  Created by Кирилл Каюмов on 08/12/13.
//  Copyright (c) 2013 MyCompany. All rights reserved.
//

#import "City.h"

@implementation City

-(void) setName:(NSString *)name age:(int)age population:(int)population {
    self->name = name;
    self->age = age;
    self->population = population;
}

-(int) getAge {
    return age;
}

-(int) getPopulation {
    return population;
}

-(NSString *) getName {
    return name;
}

-(void) nextDay {
    population += arc4random_uniform(population);
    population -= arc4random_uniform(population);
}

@end
