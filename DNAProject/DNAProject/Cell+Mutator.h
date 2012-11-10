//
//  Cell+Mutator.h
//  DNAProject
//
//  Created by Valery Kharshats on 11/4/12.
//  Copyright (c) 2012 Valery Kharshats. All rights reserved.
//

#import "Cell.h"

@interface Cell (Mutator)

-(void) mutate: (int) howPrecent;
-(NSString*) generateNewElement: (NSString*) oldElement;

@end
