//
//  Cell.h
//  osx-project-1
//
//  Created by Taras Lyapun on 31.10.12.
//  Copyright (c) 2012 Taras Lyapun. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_CAPACITY 100

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

- (id) fillDNA;
- (int) hammingDistance: (Cell*) aCell;
- (NSString*) getRandomSymbol;

@end
