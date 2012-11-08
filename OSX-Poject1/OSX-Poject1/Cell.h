//
//  Cell.h
//  OSX-Poject1
//
//  Created by Oleg Bogatenko on 05.11.12.
//  Copyright (c) 2012 DoZator Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic, strong) NSMutableArray *dna;
           
    - (int)hammingDistance:(Cell *)mas;

@end

@interface Cell(mutator)

    - (void)mutate:(unsigned int)percent;

@end
