//
//  Cell.h
//  DNA
//
//  Created by Mikhail Filippov on 11/4/12.
//  Copyright (c) 2012 Mikhail Filippov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property NSMutableArray *dna;
-(int)hammingDistance: (Cell*) c;
@end
