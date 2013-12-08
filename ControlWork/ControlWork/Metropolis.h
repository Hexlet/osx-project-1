//
//  Metropolis.h
//  ControlWork
//
//  Created by Кирилл Каюмов on 08/12/13.
//  Copyright (c) 2013 MyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"

@interface Metropolis : NSObject {
    City* array[10];
}

-(void) createCity: (NSString *)city atIndex: (int) index withPopulation: (int) population;

-(City *) getCityAtIndex: (int) index;

@end
