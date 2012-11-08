//
//  Cell.h
//  DNA
//
//  Created by Александр on 04.11.12.
//  Copyright (c) 2012 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject 
@property NSMutableArray *dna;
-(int)  hammingDistance: (Cell *)f;
-(id) getString;
@end
