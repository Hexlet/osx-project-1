//
//  Cell.m
//  DNA-1_HomeWork
//
//  Created by Sergii Savitskyi on 05.11.12.
//  Copyright (c) 2012 Musician. All rights reserved.
//

#import "Cell.h"
#define MacroDNA 100

//Имплементация класса

@implementation Cell 

@synthesize DNA;

-(int)hammingDistance:(Cell *)c
{
    
    int distance = 0;
    for (int i = 0; i < MacroDNA; i++) {
        
        if ([self.DNA objectAtIndex:i] != [c.DNA objectAtIndex:i])         {
            distance = i;
            break;
            
        };
    }
    
    //Возвращаем результат
    
    return distance; 
}


-(id) init {
    
    
    
    if (self = [super init]) {
        
        NSArray *charsDNA = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
        
        //Создаем массив с количеством ячеек = 100
        
        DNA = [NSMutableArray arrayWithCapacity:100];
        
        for (int i=0; i<100; i++) {
            
            int r_index = random()%4;
            
            [DNA addObject:[charsDNA objectAtIndex:r_index]];
        }
        
        NSLog(@"%@", DNA);
    }
    
    return self;

}
    
  /*   
    -(void) print {
        NSLog(@"%@", DNA);
    }
*/


@end
