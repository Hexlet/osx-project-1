//
//  Cell.h
//  Project1
//
//  Created by sashkam on 30.10.12.
//  Copyright (c) 2012 Verveyko Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

- (NSString *) getRandomDNASymbol;
- (int) hammingDistance: (Cell *) anCell;

@end

@interface Cell (mutator)
- (void) mutate: (int) percent;
@end


