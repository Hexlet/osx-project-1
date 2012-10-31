//
//  Cell.h
//  DNA
//
//  Created by Администратор on 10/31/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_CAPACITY 100 // размер массива
#define LETTERS @"ATGC" // возможные значения элемента клетки 

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int) hammingDistance: (Cell*) c;
-(void) print;
@end
