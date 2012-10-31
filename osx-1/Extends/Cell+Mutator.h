//
//  CellMutator.h
//  osx-1
//
//  Created by Александр Турченко on 31.10.12.
//  Copyright (c) 2012 TurchenkoAlex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
-(void)mutateDNAWithPercentage:(int)thePercentage;
@end
