//
//  Cell.h
//  Project-1
//
//  Created by Roman Nekhoroshev on 04.11.12.
//  Copyright (c) 2012 Roman Nekhoroshev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSArray *posibleNucleotides;
};

@property(readonly) NSMutableArray *DNA;

-(int) hammingDistance: (Cell *)anotherCell;
-(void) print;

@end
