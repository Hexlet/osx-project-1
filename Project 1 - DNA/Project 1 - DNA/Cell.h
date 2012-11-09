//
//  Cell.h
//  Project 1 - DNA
//
//  Created by Дмитрий Кузнецов on 05.11.12.
//  Copyright (c) 2012 Dmitriy Kuznetsov. All rights reserved.
//

//Длина цепочки ДНК
#define DNA_LENGTH 100

#import <Foundation/Foundation.h>

NSString* const baseDNAElements[4];

@interface Cell : NSObject

@property NSMutableArray *dna;

- (int)hammingDistance: (Cell *)cell;
- (NSString *)printDna;

@end
