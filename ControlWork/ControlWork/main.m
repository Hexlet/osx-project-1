//
//  main.m
//  ControlWork
//
//  Created by Кирилл Каюмов on 08/12/13.
//  Copyright (c) 2013 MyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"
#import "Metropolis.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        City *city = [[City alloc] init];
        
        [city setName:@"Kazan" age:1008 population:1000000];
        
        for (int i = 0; i < 10; i++) {
            [city nextDay];
            NSLog(@"Population = %i\n", [city getPopulation]);
        }
        
        Metropolis *myMetropolis = [[Metropolis alloc] init];
        
        for (int i = 0; i < 10; i++) {
            [myMetropolis createCity:@"LOL" atIndex:i withPopulation:arc4random_uniform(10000000)];
        }
        
        for (int i = 0; i < 10; i++) {
            [[myMetropolis getCityAtIndex:i] nextDay];
        }
    }
    return 0;
}

