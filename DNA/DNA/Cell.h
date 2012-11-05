//
//  Cell.h
//  DNA
//
//  Created by Ihor Bodnar on 11/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna;
@property (readonly) NSArray *aAvailableSymbols;

-(id) init;
-(int) hammingDistance:(Cell *)cell;
@end
