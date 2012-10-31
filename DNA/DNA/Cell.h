//
//  Cell.h
//  DNA
//
//  Created by Администратор on 10/31/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_CAPACITY 100 // размер массива DNA
#define LETTERS @"ATGC" // возможные значения элемента клетки (использовать uppercase)

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int) hammingDistance: (Cell*) c;
-(NSString*) generateRandomNucletoid;
-(void) print;
@end
