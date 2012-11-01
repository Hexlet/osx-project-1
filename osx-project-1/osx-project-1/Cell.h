//
//  Cell.h
//  osx-project-1
//
//  Created by Alexey Kulik on 10/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSArray* dnaChars;
}

@property (nonatomic, readonly, strong) NSMutableArray* dna;


- (int) hammingDistance:(Cell*) cell;
- (void) mutate:(int) percentsToMutate;
- (void) print;

@end
