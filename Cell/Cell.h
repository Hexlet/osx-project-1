//
//  Cell.h
//  DNA
//
//  Created by Georgiy Mostolovitsa on 31.10.12.
//  Copyright (c) 2012 Georgiy Mostolovitsa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

@property (readonly) NSArray* nucleotides;

- (id)initWithCapacity:(int)numItems;
- (id)getRandomNucleotide;
- (int)hammingDistance:(Cell *)cell;
- (id)getDNA;
- (void)replaceAtIndex:(int)index withObject:(id)object;

@end