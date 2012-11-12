//
//  Cell.h
//  1prj-deenka
//
//  Created by Wladi on 05.11.12.
//  Copyright (c) 2012 noorg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    
    // если объявить переменные здесь (Cell.h), то они будут доступны как self->var
    // из категории в main.m
    // если объявить в Cell.m - то до vars уже не достучаться
    
    NSMutableArray *DNA;
    NSString *DNA_bases;
    NSInteger i; //, j;
}

- (int) hammingDistance: (Cell*) partner;

// for debug only!
- (void) print;

@end
