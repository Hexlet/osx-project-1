//
//  Cell.h
//  DNK
//
//  Created by Danil Galeev on 03.11.12.
//  Copyright (c) 2012 Danil Galeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
    @property NSMutableArray *dnk;
    @property NSArray *dnksymbols;

    -(int) hammingDistance: (Cell*)cell;
    -(NSString *) getRandomDnkSymbol;
@end
