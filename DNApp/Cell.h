//
//  Cell.h
//  DNApp
//
//  Created by Oleksandr Gnatisin on 02.11.12.
//  Copyright (c) 2012 Oleksandr Gnatisin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna; // массив для ДНК
@property NSArray *randomArray; // массив для значений 

- (int) hammingDistance:(Cell *) cell;

// Метод для генирации рандома
- (NSString *) getRandom;
@end
