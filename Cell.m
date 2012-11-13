//
//  Cell.m
//  DNK
//
//  Created by evgen on 11/9/12.
//  Copyright (c) 2012 evgen. All rights reserved.
//

#import "Cell.h"

@implementation Cell
    
//Array object initialization
-(id) init{
    self = [super init];
    
    _DNA = [[NSMutableArray alloc] init];
    _DNA = [NSMutableArray arrayWithCapacity:100];    
    
    if(self)
        for(int i=1;i<=100;i++) //fill the array with random characters
            [_DNA addObject:[Cell getRandomCharacter]];
    
    return self;
    
}

-(int)hammingDistance:(Cell*)number{
    int count=0;
        
    for(int i=0;i<100;i++){
        //compare two arrays
        if(!([(NSString*)[[self DNA] objectAtIndex:i] isEqualToString:[[number DNA] objectAtIndex:i]]))
            count++;
      
    }
   
    return count;
}


+(NSString*)getRandomCharacter{
    
    switch(random()%4){
        case 0:
            return @"A";
        case 1:
            return @"T";
        case 2:
            return @"G";
                }
    return @"C";    
}


@end
