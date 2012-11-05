//
//  Cell.h
//  Project1
//
//  Created by sashkam on 30.10.12.
//  Copyright (c) 2012 Verveyko Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_LENGHT 100         //Длина цепочки ДНК

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;  //Массив оснований
@property (readonly) NSArray *DNASymbols;  //Азотистые основания

- (int) hammingDistance: (Cell *) anCell;

@end


