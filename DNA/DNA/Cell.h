//
//  Cell.h
//  dna
//
//  Created by Ilya Batozskiy on 31.10.12.
//  Copyright (c) 2012 Ilya Batozskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA; // цепочка ДНК
@property NSArray *DNAtypes; // типы аминокислот
@property (readonly) int DNAamount; // длинна цепоки ДНК

-(int) hammingDistance:(Cell *)anotherCell;

@end