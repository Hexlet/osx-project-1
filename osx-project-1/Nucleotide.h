//
//  Nucleotide.h
//  osx-project-1
//
//  Created by Yuriy Zarovnuy on 07.11.12.
//  Copyright (c) 2012 Yuriy Zarovnuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NucleotideType.h"

@interface Nucleotide : NSObject

@property enum NucleotideType type;

-(NSString*) typeToString;

@end
