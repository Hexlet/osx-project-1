//
//  Cell.h
//  DNA
//
//  Created by Dmitriy Zhukov on 06.11.12.
//  Copyright (c) 2012 Dmitriy Zhukov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property (nonatomic, strong) NSMutableArray *DNA;
@property (nonatomic, strong) NSString *rangeOfDNACellValues; // Переменная для хранения диапазона возможных значений ячейки ДНК (A, T, G или С)
@property unsigned int arrayCapacity; // Переменная для хранения размера массива DNA

- (unsigned int) hammingDistance: (Cell*) anotherDNA;

@end
