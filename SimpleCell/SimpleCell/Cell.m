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

//инициализирует объект класса с предзаполненной переменной DNA заданной длины
- (id) initWithGeneratedDNA{
    self = [super init];
    if (self){
        avaiableKeys = @[@"A", @"T", @"G", @"C"];
        _DNA = [NSMutableArray array];
        for (int i=0; i<MAX_ITEMS; i++) {
            [_DNA addObject:[avaiableKeys objectAtIndex:(arc4random()%[avaiableKeys count])]];
        }
    }
    return self;
}

- (int)hammingDistance:(Cell *)comparedCell{
    int distance = 0;
    for (int i=0;i<MAX_ITEMS;i++){
        if ([(NSString *)[_DNA objectAtIndex:i] isEqualToString:(NSString *)[comparedCell.DNA objectAtIndex:i]]){
            distance++;
//            NSLog(@"%i: %@==%@", i, [_DNA objectAtIndex:i], [comparedCell.DNA objectAtIndex:i]);
        }else{
//            NSLog(@"%i: %@!=%@", i, [_DNA objectAtIndex:i], [comparedCell.DNA objectAtIndex:i]);
        }
        
    }
    return distance;
}



@end
