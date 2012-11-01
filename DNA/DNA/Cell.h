//
//  Cell.h
//  DNA
//
//  Created by IBEC IBEC on 10/31/12.
//  Copyright (c) 2012 IBEC IBEC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic, strong) NSMutableArray *DNA; // Элементы массива ДНК
@property (nonatomic, strong) NSArray *DNAs; // A, T, G, C
@property int DNALength; // Длина массива ДНК (100)

- (int)hammingDistance:(NSMutableArray *)DNAArray;
- (void)printDNA;

@end
