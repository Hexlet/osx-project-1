//
//  Cell.h
//  project1-dna
//
//  Created by Артём on 07.11.12.
//
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray* _DNA;
}

-(Cell*) init;
-(void) print;
-(int) hammingDistance: (Cell *) other;
-(NSString *) randomNucleobase;

@end