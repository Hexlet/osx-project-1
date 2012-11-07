//
//  Cell.m
//  DNA
//
//  Created by Vadim Yazvinskiy on 11/4/12.
//  Copyright (c) 2012 Vadim Yazvinskiy. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    
    if (self) {
        //Массив символов.
        NSArray * arrayObject = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        
        _DNA = [[NSMutableArray alloc] init];
        
        //В цикле заполняю каждый элемент случайным символом.
        for (int i = 0; i < 100; i++) {
            [_DNA insertObject:arrayObject[arc4random() % 4] atIndex:i];
        }

    }
        
    return self;
}

-(int) hammingDistance:(Cell *)anotherCell {
    //Счетчик различий.
    int count = 0;
    
    //В цикле сравниваю каждый элемент.
    for (int i = 0; i < 100; i++) {
        if (self.DNA[i] != anotherCell.DNA[i]) {
            
            //Увеличиваю счетчик различий на единицу.
            count++;
        }
    }
    
    return count;
}

-(void) print {
    NSLog(@"%@", _DNA);
}

@end
