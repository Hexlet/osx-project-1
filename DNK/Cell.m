//
//  Cell.m
//  DNK
//
//  Created by Andrew Krylov on 31.10.12.
//  Copyright (c) 2012 Andrew Krylov. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
}

-(id) init {
    self = [super init];
    if (self)
    {

        //Проинициализируем массив
        _dnk = [NSMutableArray arrayWithCapacity:100];
        
        NSArray *validDnkSet = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        
        //Заполним массив случайными значениями из validDnkSet
        for (int i=0; i<100; i++) {
            [_dnk addObject:[validDnkSet objectAtIndex: arc4random() % [validDnkSet count]]];
        }
        
    }
    
    return self;
}


-(int) hammingDistance:(Cell *)d {
    int distance = 0;
    if (d)
    {
        for (int i=0; i<100; i++) {
            //Увеличим distance в случае если строки не равны
            if ([(NSString*)[_dnk objectAtIndex:i] isEqualToString:[[d dnk] objectAtIndex:i]] !=YES)
            {
                distance++;
            }
        }
    }
    return distance;
}

-(NSString *) debugDescription {
    
    //Выведем результа в лог
    NSString *resultString = @"";
    
    for (int i=0; i<[[self dnk] count]; i++) {
        resultString = [resultString stringByAppendingString:[[self dnk] objectAtIndex: i]];
    }
    return resultString;
}
@end
