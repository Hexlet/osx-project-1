//
//  Cell.m
//  task_1_dna
//
//  Created by Sergey Sh on 05.11.12.
//  Copyright (c) 2012 Sergey Sh. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize count;
@synthesize DNA;
@synthesize dnaString;

-(NSString*) getUnit {
    int generated;
  
    generated = (random()%4) + 1;

    switch (generated) {
        case 1:
            return @"A";
            break;
        case 2:
            return @"T";
            break;
        case 3:
            return @"G";
            break;
        case 4:
            return @"C";
            break;
        default:
            return @"A";
            break;
    }
}

-(id) init {
    srandom(time(NULL));
    self = [super init];
    
    DNA = [[NSMutableArray alloc] init];
    
    return self;
}

-(void) createDNA {
    NSString* unit;

    //тут будет код заполнения массива
    for (int i = 0; i < self.count; i++) {
        unit = [self getUnit];          // получаем новый ген
        
        [DNA addObject:unit];           // добавили в DNA новый unit
        
    }
}

-(NSString *) getDNAString {
    dnaString = [[NSMutableString alloc] init];
    
    for (int i = 0; i < self.count; i++) {
       [dnaString appendString: [[self DNA] objectAtIndex:i]];
    }
    
    return dnaString;
}


-(int) hammingDistance:(Cell *) otherDNA {
    int distance = 0;
    
    if (otherDNA.count != self.count) {
        return -1;
    }
    
    for (int i = 0; i < self.count; i++) {
        if (![[[self DNA] objectAtIndex:i] isEqual: [[otherDNA DNA] objectAtIndex:i]]) {
            distance = distance + 1;
        }
        
    }
   
    return distance;
}

@end
