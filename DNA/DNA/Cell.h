//
//  Cell.h
//  DNA


#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
@protected
    NSArray *_elements;
}

@property NSMutableArray *dna;

- (id) init;
- (id) initWithCount: (int)count;

- (int) hammingDistance: (Cell*) dna;
- (void) fillDNA: (int) capacity;

@end
