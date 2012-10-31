#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *dna;
    NSArray *dnaItems;
}

@property NSMutableArray *dna;
@property (readonly) NSArray *dnaItems;

- (int)hammingDistance:(Cell *)cell;

@end