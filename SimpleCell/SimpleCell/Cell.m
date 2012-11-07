//
//  Cell.m
//  SimpleCell
//
//  Created by Dmitry Svetlakov on 11/2/12.
//  Copyright (c) 2012 Dmitry Svetlakov. All rights reserved.
//

#import "Cell.h"

@implementation Cell
const int MAX_ITEMS = 100;
static NSArray *availableKeys;

//инициализирует объект класса с предзаполненной переменной DNA заданной длины
- (id) init{
    self = [super init];
    if (self){
        
        _DNA = [NSMutableArray arrayWithCapacity:MAX_ITEMS];
        for (int i=0; i<MAX_ITEMS; i++) {
            [_DNA addObject:[[Cell availableKeys] objectAtIndex:(arc4random()%[[Cell availableKeys] count])]];
        }
    }
    return self;
}

- (int)hammingDistance:(Cell *)comparedCell{
    int distance = 0;
    for (int i=0;i<MAX_ITEMS;i++){
        if (![[_DNA objectAtIndex:i] isEqualTo:[comparedCell.DNA objectAtIndex:i]]){
            distance++;
//            NSLog(@"%i: %@!=%@", i, [_DNA objectAtIndex:i], [comparedCell.DNA objectAtIndex:i]);
        }else{
//            NSLog(@"%i: %@==%@", i, [_DNA objectAtIndex:i], [comparedCell.DNA objectAtIndex:i]);
        }
        
    }
    return distance;
}

+(NSArray*) availableKeys{
    if (availableKeys==nil){
       availableKeys = @[@"A", @"T", @"G", @"C"];
    }
    return availableKeys;
}



@end
