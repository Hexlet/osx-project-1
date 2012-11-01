//
//  Cell.h
//  osx-project-1
//
//  Created by Alexey Kulik on 10/31/12.
//  Copyright (c) 2012 Alexey Kulik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Cell : NSObject {
    NSArray* dnaChars;
}

@property (nonatomic, readonly, strong) NSMutableArray* dna;

- (int) hammingDistance:(Cell*) cell;
- (void) print;

@end
