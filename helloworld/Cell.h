//
//  Cell.h
//  helloworld
//
//  Created by Volodia on 10.11.12.
//
//

#import <Foundation/Foundation.h>
#import "Nucleotide.h"

@interface Cell : NSObject

-(int) hammingDistance: (Cell *) cell;
-(Nucleotide *) nucleoAtIndex:(int) index;
-(void) setNucleo:(Nucleotide *) nucleo atIndex:(int) index;

@end
