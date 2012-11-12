//
//  Cell.h
//  osx-project-1
//
//  Created by Alex Bakoushin on 09.11.12.
//  Copyright (c) 2012 Alex Bakoushin. All rights reserved.
//

#import <Foundation/Foundation.h>

// Объявление констант
#define DNA_LENGTH 100 // Длина массива DNA
#define LETTERS @"ATGC" // Набор букв, используемых для заполнения массива

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int) hammingDistance: (Cell*)cell;

@end
