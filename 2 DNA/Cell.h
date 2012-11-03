//
//  Cell.h
//  2 DNA
//
//  Created by Vf on 30.10.12.
//  Copyright (c) 2012 Vf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject;

@property NSMutableArray *DNA;
@property int genomeLength;

- (id) initWithGenomeLength: (UInt) genLen;
- (void) show;
- (int) hammingDistance: (Cell*) otherCell;

@end
