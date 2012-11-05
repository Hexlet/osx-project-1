//
//  Cell.h
//  DNA
//
//  Created by Pavel Krishtalskiy on 03.11.12.
//  Copyright (c) 2012 Pavel Krishtalskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSArray *charSet;
}

@property NSMutableArray *DNA;

// Длинна клетки ДНК. При инициализации зададим значение 100
@property (readonly) int cellLength;

- (id) init;
- (int) hammingDistance:(Cell*)cell;
- (void) printDNA;
@end
