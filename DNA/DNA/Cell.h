//
//  Cell.h
//  DNA


#import <Foundation/Foundation.h>

@interface Cell : NSObject
{

@protected
    NSMutableArray *_dna;
    NSArray *_elements;
    int _count;
}

- (Cell*) init;
- (int) getCount;
- (NSArray*) getDna;

- (int) hammingDistance: (Cell*) dna;

@end
