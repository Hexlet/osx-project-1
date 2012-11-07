//
//  Cell+mutator.h
//  osx-project-1
//
//  Created by Ivan Kuzmin on 11/5/12.
//  Copyright (c) 2012 Ivan Kuzmin. All rights reserved.
//

#import "Cell.h"

@interface Cell (mutator)

    -(void)mutate: (int)percent;

    +(int)getUniqueLocus: (int *)usedLocuses numerum: (int)number;

    -(NSString*)getNewNucteotide: (NSString*)oldOne;
@end
